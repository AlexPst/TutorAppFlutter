import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/app/router/app_routes.dart';
import 'package:tutor_app/app/router/app_shell.dart';
import 'package:tutor_app/app/router/not_found_screen.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:tutor_app/features/finance/presentation/screens/finance_screen.dart';
import 'package:tutor_app/features/finance/presentation/screens/payment_form_screen.dart';
import 'package:tutor_app/features/lessons/presentation/screens/lesson_form_screen.dart';
import 'package:tutor_app/features/lessons/presentation/screens/lessons_screen.dart';
import 'package:tutor_app/features/progress/presentation/screens/progress_entry_form_screen.dart';
import 'package:tutor_app/features/progress/presentation/screens/progress_screen.dart';
import 'package:tutor_app/features/settings/presentation/screens/settings_screen.dart';
import 'package:tutor_app/features/students/presentation/screens/enrollment_form_screen.dart';
import 'package:tutor_app/features/students/presentation/screens/student_details_screen.dart';
import 'package:tutor_app/features/students/presentation/screens/student_form_screen.dart';
import 'package:tutor_app/features/students/presentation/screens/students_list_screen.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final router = GoRouter(
    initialLocation: AppRoutes.dashboard,
    errorBuilder: (_, _) => const NotFoundScreen(),
    routes: [
      GoRoute(path: '/', redirect: (_, _) => AppRoutes.dashboard),

      // Формы занятия, платежа и записи прогресса открываются поверх
      // оболочки из любого раздела (`context.push`) и возвращают туда же. Объявлены раньше
      // оболочки, чтобы `/lessons/new` не перехватил раздел расписания.
      GoRoute(
        path: AppRoutes.settings,
        builder: (_, _) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/lessons/new',
        builder: (_, state) {
          final query = state.uri.queryParameters;
          return LessonFormScreen(
            studentId: int.tryParse(query['studentId'] ?? ''),
            date: DateTime.tryParse(query['date'] ?? ''),
          );
        },
      ),
      GoRoute(
        path: '/lessons/:lessonId/edit',
        builder: (_, state) {
          final lessonId = int.tryParse(state.pathParameters['lessonId']!);
          return lessonId == null
              ? const NotFoundScreen()
              : LessonFormScreen(lessonId: lessonId);
        },
      ),

      GoRoute(
        path: '/payments/new',
        builder: (_, state) {
          final query = state.uri.queryParameters;
          final amountKopecks = int.tryParse(query['amount'] ?? '');
          return PaymentFormScreen(
            studentId: int.tryParse(query['studentId'] ?? ''),
            amount: amountKopecks == null ? null : Money(amountKopecks),
          );
        },
      ),
      GoRoute(
        path: '/payments/:paymentId/edit',
        builder: (_, state) {
          final paymentId = int.tryParse(state.pathParameters['paymentId']!);
          return paymentId == null
              ? const NotFoundScreen()
              : PaymentFormScreen(paymentId: paymentId);
        },
      ),

      GoRoute(
        path: '/progress/new',
        builder: (_, state) {
          final query = state.uri.queryParameters;
          final enrollmentId = int.tryParse(query['enrollmentId'] ?? '');
          return enrollmentId == null
              ? const NotFoundScreen()
              : ProgressEntryFormScreen(
                  enrollmentId: enrollmentId,
                  lessonId: int.tryParse(query['lessonId'] ?? ''),
                );
        },
      ),
      GoRoute(
        path: '/progress/:entryId/edit',
        builder: (_, state) {
          final entryId = int.tryParse(state.pathParameters['entryId']!);
          return entryId == null
              ? const NotFoundScreen()
              : ProgressEntryFormScreen(entryId: entryId);
        },
      ),

      StatefulShellRoute.indexedStack(
        builder: (_, _, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.dashboard,
                builder: (_, _) => const DashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.lessons,
                builder: (_, _) => const LessonsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.finance,
                builder: (_, state) {
                  final tab = FinanceTab.parse(
                    state.uri.queryParameters['tab'],
                  );
                  // Ключ пересоздаёт экран, если ссылка ведёт на другую
                  // вкладку (например, из напоминания о долге).
                  return FinanceScreen(key: ValueKey(tab), initialTab: tab);
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.students,
                builder: (_, _) => const StudentsListScreen(),
                routes: _studentRoutes,
              ),
            ],
          ),
        ],
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}

final _studentRoutes = [
  // Объявлен раньше `:studentId`, иначе `new` разобралось бы как id.
  GoRoute(path: 'new', builder: (_, _) => const StudentFormScreen()),
  GoRoute(
    path: ':studentId',
    builder: (_, state) => _withIds(
      state,
      (studentId, _) => StudentDetailsScreen(studentId: studentId),
    ),
    routes: [
      GoRoute(
        path: 'edit',
        builder: (_, state) => _withIds(
          state,
          (studentId, _) => StudentFormScreen(studentId: studentId),
        ),
      ),
      GoRoute(
        path: 'progress/:enrollmentId',
        builder: (_, state) => _withIds(
          state,
          (studentId, enrollmentId) => enrollmentId == null
              ? const NotFoundScreen()
              : ProgressScreen(
                  studentId: studentId,
                  enrollmentId: enrollmentId,
                ),
        ),
      ),
      GoRoute(
        path: 'enrollments/new',
        builder: (_, state) => _withIds(
          state,
          (studentId, _) => EnrollmentFormScreen(studentId: studentId),
        ),
      ),
      GoRoute(
        path: 'enrollments/:enrollmentId/edit',
        builder: (_, state) => _withIds(
          state,
          (studentId, enrollmentId) => enrollmentId == null
              ? const NotFoundScreen()
              : EnrollmentFormScreen(
                  studentId: studentId,
                  enrollmentId: enrollmentId,
                ),
        ),
      ),
    ],
  ),
];

/// Разбирает числовые параметры пути. Нечисловой `studentId` — это
/// несуществующая страница.
Widget _withIds(
  GoRouterState state,
  Widget Function(int studentId, int? enrollmentId) builder,
) {
  final studentId = int.tryParse(state.pathParameters['studentId'] ?? '');
  if (studentId == null) return const NotFoundScreen();
  final enrollmentId = int.tryParse(state.pathParameters['enrollmentId'] ?? '');
  return builder(studentId, enrollmentId);
}

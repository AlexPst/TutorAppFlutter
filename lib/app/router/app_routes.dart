import 'package:tutor_app/core/domain/money.dart';

/// Пути приложения. Экраны строят ссылки только через эти методы.
abstract final class AppRoutes {
  static const dashboard = '/dashboard';
  static const settings = '/settings';
  static const lessons = '/lessons';
  static const finance = '/finance';
  static const students = '/students';
  static const newStudent = '/students/new';

  static String student(int studentId) => '/students/$studentId';

  static String editStudent(int studentId) => '/students/$studentId/edit';

  static String newEnrollment(int studentId) =>
      '/students/$studentId/enrollments/new';

  static String editEnrollment(int studentId, int enrollmentId) =>
      '/students/$studentId/enrollments/$enrollmentId/edit';

  /// Прогресс ученика по одному предмету.
  static String studentProgress(int studentId, int enrollmentId) =>
      '/students/$studentId/progress/$enrollmentId';

  /// Новая запись прогресса; [lessonId] сразу привязывает её к занятию.
  static String newProgressEntry({required int enrollmentId, int? lessonId}) =>
      Uri(
        path: '/progress/new',
        queryParameters: {
          'enrollmentId': '$enrollmentId',
          'lessonId': ?lessonId?.toString(),
        },
      ).toString();

  static String editProgressEntry(int entryId) => '/progress/$entryId/edit';

  /// Форма нового занятия. Параметры предзаполняют поля.
  static String newLesson({int? studentId, DateTime? date}) => Uri(
    path: '/lessons/new',
    queryParameters: {
      'studentId': ?studentId?.toString(),
      'date': ?date?.let(formatDateParam),
    },
  ).toString();

  static String editLesson(int lessonId) => '/lessons/$lessonId/edit';

  /// Раздел «Финансы» на нужной вкладке: `payments`, `debtors`, `income`.
  static String financeTab(String tab) =>
      Uri(path: finance, queryParameters: {'tab': tab}).toString();

  /// Форма платежа; [amount] предзаполняет сумму (например, весь долг).
  static String newPayment({int? studentId, Money? amount}) => Uri(
    path: '/payments/new',
    queryParameters: {
      'studentId': ?studentId?.toString(),
      'amount': ?amount?.kopecks.toString(),
    },
  ).toString();

  static String editPayment(int paymentId) => '/payments/$paymentId/edit';

  /// Дата в параметре пути: `2026-10-13`.
  static String formatDateParam(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';
}

extension _Let<T extends Object> on T {
  R let<R>(R Function(T value) transform) => transform(this);
}

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/core/database/database_providers.dart';
import 'package:tutor_app/features/finance/finance_providers.dart';
import 'package:tutor_app/features/lessons/data/repositories/drift_lesson_repository.dart';
import 'package:tutor_app/features/lessons/domain/repositories/lesson_repository.dart';
import 'package:tutor_app/features/lessons/domain/services/lesson_outcome_service.dart';
import 'package:tutor_app/features/lessons/domain/usecases/create_lesson.dart';
import 'package:tutor_app/features/lessons/domain/usecases/mark_lesson.dart';
import 'package:tutor_app/features/lessons/domain/usecases/reschedule_lesson.dart';
import 'package:tutor_app/features/lessons/domain/usecases/update_lesson.dart';
import 'package:tutor_app/features/progress/progress_providers.dart';
import 'package:tutor_app/features/students/students_providers.dart';

part 'lessons_providers.g.dart';

@Riverpod(keepAlive: true)
LessonRepository lessonRepository(Ref ref) =>
    DriftLessonRepository(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
LessonOutcomeService lessonOutcomeService(Ref ref) => LessonOutcomeService(
  packages: ref.watch(packageRepositoryProvider),
  progress: ref.watch(progressRepositoryProvider),
);

@Riverpod(keepAlive: true)
CreateLessonUseCase createLessonUseCase(Ref ref) => CreateLessonUseCase(
  lessons: ref.watch(lessonRepositoryProvider),
  students: ref.watch(studentRepositoryProvider),
  outcome: ref.watch(lessonOutcomeServiceProvider),
  transaction: ref.watch(transactionRunnerProvider),
);

@Riverpod(keepAlive: true)
UpdateLessonUseCase updateLessonUseCase(Ref ref) => UpdateLessonUseCase(
  lessons: ref.watch(lessonRepositoryProvider),
  outcome: ref.watch(lessonOutcomeServiceProvider),
  transaction: ref.watch(transactionRunnerProvider),
);

@Riverpod(keepAlive: true)
MarkLessonUseCase markLessonUseCase(Ref ref) => MarkLessonUseCase(
  lessons: ref.watch(lessonRepositoryProvider),
  students: ref.watch(studentRepositoryProvider),
  progress: ref.watch(progressRepositoryProvider),
  outcome: ref.watch(lessonOutcomeServiceProvider),
  transaction: ref.watch(transactionRunnerProvider),
);

@Riverpod(keepAlive: true)
RescheduleLessonUseCase rescheduleLessonUseCase(Ref ref) =>
    RescheduleLessonUseCase(
      lessons: ref.watch(lessonRepositoryProvider),
      transaction: ref.watch(transactionRunnerProvider),
    );

import 'package:tutor_app/features/finance/domain/repositories/package_repository.dart';
import 'package:tutor_app/features/finance/domain/services/billing_policy.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';
import 'package:tutor_app/features/progress/domain/repositories/progress_repository.dart';

/// Последствия смены статуса занятия, общие для всех use cases:
/// выбор пакета для оплаты и снятие оценки с непроведённого занятия.
/// Вызывается внутри транзакции use case.
class LessonOutcomeService {
  LessonOutcomeService({required this._packages, required this._progress});

  final PackageRepository _packages;
  final ProgressRepository _progress;

  /// Возвращает [next] с пакетом, выбранным по [BillingPolicy].
  Future<Lesson> withBilling({
    required Lesson? previous,
    required Lesson next,
  }) async {
    final available = next.status.isBillable
        ? await _packages.getAvailablePackages(next.enrollmentId)
        : const <Never>[];
    return next.copyWith(
      packageId: BillingPolicy.packageFor(
        previous: previous,
        next: next,
        availablePackages: available,
      ),
    );
  }

  /// Оценка бывает только у проведённого занятия: при другом статусе она
  /// снимается, а комментарий к занятию сохраняется.
  Future<void> dropGradeUnlessCompleted(Lesson lesson) async {
    if (lesson.status == LessonStatus.completed) return;
    final entry = await _progress.getEntryForLesson(lesson.id);
    if (entry == null || entry.grade == null) return;
    await _progress.saveLessonResult(
      lessonId: lesson.id,
      enrollmentId: lesson.enrollmentId,
      date: lesson.startsAt,
      note: entry.note,
    );
  }
}

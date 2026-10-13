/// Причина ожидаемой ошибки. Domain не знает языка интерфейса: текст
/// для пользователя подбирает UI по причине и параметрам [AppFailure.args].
enum FailureReason {
  studentNotFound,
  enrollmentNotFound,
  subjectNotFound,
  lessonNotFound,
  paymentNotFound,
  packageNotFound,
  progressEntryNotFound,

  /// `args`: `name`.
  subjectNameTaken,
  subjectInUse,
  enrollmentExists,

  /// `args`: `used` — сколько занятий уже списано.
  packageBelowUsage,

  lessonDurationOutOfRange,
  lessonPriceInvalid,
  enrollmentArchived,
  rescheduleOnlyPlanned,
  gradeOnlyForCompleted,

  /// `args`: `min`, `max`.
  gradeOutOfScale,

  paymentAmountInvalid,
  paymentDateInFuture,

  progressEntryEmpty,
  progressDateInFuture,
  lessonOfOtherSubject,
  lessonNotPast,
  lessonHasProgressEntry,
}

/// Ожидаемые ошибки предметной области.
sealed class AppFailure implements Exception {
  const AppFailure(this.reason, [this.args = const {}]);

  final FailureReason reason;

  /// Параметры для текста ошибки, например границы шкалы оценок.
  final Map<String, Object> args;

  @override
  String toString() => '$runtimeType(${reason.name}, $args)';
}

/// Запись не найдена: её удалили или передан неверный идентификатор.
final class NotFoundFailure extends AppFailure {
  const NotFoundFailure(super.reason, [super.args]);
}

/// Операция нарушает правила данных: дубликат, удаление используемой записи
/// и т. п.
final class ConflictFailure extends AppFailure {
  const ConflictFailure(super.reason, [super.args]);
}

/// Данные не прошли проверку бизнес-правил.
final class ValidationFailure extends AppFailure {
  const ValidationFailure(super.reason, [super.args]);
}

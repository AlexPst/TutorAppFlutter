import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/field_error.dart';
import 'package:tutor_app/features/students/domain/student_validator.dart';
import 'package:tutor_app/l10n/app_localizations.dart';

export 'package:tutor_app/l10n/app_localizations.dart';

extension BuildContextL10n on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// Тексты для кодов domain и составные форматы, которым нужен перевод.
extension AppLocalizationsHelpers on AppLocalizations {
  String fieldError(FieldError error) => switch (error) {
    FieldError.nameRequired => fieldNameRequired,
    FieldError.nameTooLong => fieldNameTooLong(StudentValidator.maxNameLength),
    FieldError.phoneInvalid => fieldPhoneInvalid,
    FieldError.telegramInvalid => fieldTelegramInvalid,
    FieldError.integerRequired => fieldIntegerRequired,
    FieldError.gradeBoundOutOfRange => fieldGradeBoundOutOfRange(
      StudentValidator.maxGrade,
    ),
    FieldError.gradeRangeInvalid => fieldGradeRangeInvalid,
    FieldError.priceRequired => fieldPriceRequired,
    FieldError.amountRequired => fieldAmountRequired,
    FieldError.moneyFormat => fieldMoneyFormat,
    FieldError.amountTooLarge => fieldAmountTooLarge,
    FieldError.amountNotPositive => fieldAmountNotPositive,
  };

  String failure(AppFailure failure) {
    final args = failure.args;
    int intArg(String name) => args[name]! as int;
    return switch (failure.reason) {
      FailureReason.studentNotFound => failureStudentNotFound,
      FailureReason.enrollmentNotFound => failureEnrollmentNotFound,
      FailureReason.subjectNotFound => failureSubjectNotFound,
      FailureReason.lessonNotFound => failureLessonNotFound,
      FailureReason.paymentNotFound => failurePaymentNotFound,
      FailureReason.packageNotFound => failurePackageNotFound,
      FailureReason.progressEntryNotFound => failureProgressEntryNotFound,
      FailureReason.subjectNameTaken => failureSubjectNameTaken(
        args['name']! as String,
      ),
      FailureReason.subjectInUse => failureSubjectInUse,
      FailureReason.enrollmentExists => failureEnrollmentExists,
      FailureReason.packageBelowUsage => failurePackageBelowUsage(
        intArg('used'),
      ),
      FailureReason.lessonDurationOutOfRange => failureLessonDurationOutOfRange,
      FailureReason.lessonPriceInvalid => failureLessonPriceInvalid,
      FailureReason.enrollmentArchived => failureEnrollmentArchived,
      FailureReason.rescheduleOnlyPlanned => failureRescheduleOnlyPlanned,
      FailureReason.gradeOnlyForCompleted => failureGradeOnlyForCompleted,
      FailureReason.gradeOutOfScale => failureGradeOutOfScale(
        intArg('min'),
        intArg('max'),
      ),
      FailureReason.paymentAmountInvalid => failurePaymentAmountInvalid,
      FailureReason.paymentDateInFuture => failurePaymentDateInFuture,
      FailureReason.progressEntryEmpty => failureProgressEntryEmpty,
      FailureReason.progressDateInFuture => failureProgressDateInFuture,
      FailureReason.lessonOfOtherSubject => failureLessonOfOtherSubject,
      FailureReason.lessonNotPast => failureLessonNotPast,
      FailureReason.lessonHasProgressEntry => failureLessonHasProgressEntry,
    };
  }

  /// `45 мин`, `1 ч`, `1 ч 30 мин` / `1 h 30 min`.
  String duration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    if (hours == 0) return durationMinutes(minutes);
    if (minutes == 0) return durationHours(hours);
    return durationHoursMinutes(hours, minutes);
  }

  /// `12–18 октября` / `October 12–18`; через границу месяцев —
  /// `28 сентября – 4 октября`.
  String weekRange(DatePeriod week) {
    final first = week.start;
    final last = DateTime(week.end.year, week.end.month, week.end.day - 1);
    final dayMonth = DateFormat.MMMMd(localeName);
    if (first.month != last.month) {
      return weekRangeCrossMonth(dayMonth.format(first), dayMonth.format(last));
    }
    return weekRangeSameMonth(
      '${first.day}',
      '${last.day}',
      // Месяц в форме, которую локаль ставит рядом с числом
      // («октября», «October»).
      dayMonth.format(last).replaceAll(RegExp(r'\d+'), '').trim(),
    );
  }
}

/// Валидатор поля формы из проверки domain: код ошибки → текст по локали.
FormFieldValidator<String> localizedValidator(
  BuildContext context,
  FieldError? Function(String? value) check,
) =>
    (value) => switch (check(value)) {
      final error? => context.l10n.fieldError(error),
      null => null,
    };

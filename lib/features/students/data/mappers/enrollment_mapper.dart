import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/students/domain/models/enrollment.dart';

extension EnrollmentRowMapper on EnrollmentRow {
  Enrollment toModel() => Enrollment(
    id: id,
    studentId: studentId,
    subjectId: subjectId,
    rate: Money(rateKopecks),
    defaultDuration: Duration(minutes: defaultDurationMinutes),
    note: note,
    isArchived: isArchived,
  );
}

extension EnrollmentDraftMapper on EnrollmentDraft {
  EnrollmentsCompanion toCompanion() => EnrollmentsCompanion.insert(
    studentId: studentId,
    subjectId: subjectId,
    rateKopecks: rate.kopecks,
    defaultDurationMinutes: Value(defaultDuration.inMinutes),
    note: Value(note),
  );
}

extension EnrollmentMapper on Enrollment {
  /// Ученик и предмет не входят в обновление: направление к ним привязано.
  EnrollmentsCompanion toUpdateCompanion(DateTime updatedAt) =>
      EnrollmentsCompanion(
        rateKopecks: Value(rate.kopecks),
        defaultDurationMinutes: Value(defaultDuration.inMinutes),
        note: Value(note),
        isArchived: Value(isArchived),
        updatedAt: Value(updatedAt),
      );
}

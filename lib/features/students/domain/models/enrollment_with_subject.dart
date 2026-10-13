import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutor_app/features/students/domain/models/enrollment.dart';
import 'package:tutor_app/features/subjects/domain/models/subject.dart';

part 'enrollment_with_subject.freezed.dart';

@freezed
abstract class EnrollmentWithSubject with _$EnrollmentWithSubject {
  const factory EnrollmentWithSubject({
    required Enrollment enrollment,
    required Subject subject,
  }) = _EnrollmentWithSubject;
}

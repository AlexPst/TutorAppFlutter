import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/features/students/domain/models/grade_scale.dart';
import 'package:tutor_app/features/students/domain/models/student.dart';

extension StudentRowMapper on StudentRow {
  Student toModel() => Student(
    id: id,
    fullName: fullName,
    phone: phone,
    telegram: telegram,
    note: note,
    gradeScale: gradeScale,
    isArchived: isArchived,
  );

  GradeScale get gradeScale =>
      GradeScale(min: gradeScaleMin, max: gradeScaleMax);
}

extension StudentDraftMapper on StudentDraft {
  StudentsCompanion toCompanion() => StudentsCompanion.insert(
    fullName: fullName.trim(),
    phone: Value(phone),
    telegram: Value(telegram),
    note: Value(note),
    gradeScaleMin: Value(gradeScale.min),
    gradeScaleMax: Value(gradeScale.max),
  );
}

extension StudentMapper on Student {
  StudentsCompanion toUpdateCompanion(DateTime updatedAt) => StudentsCompanion(
    fullName: Value(fullName.trim()),
    phone: Value(phone),
    telegram: Value(telegram),
    note: Value(note),
    gradeScaleMin: Value(gradeScale.min),
    gradeScaleMax: Value(gradeScale.max),
    isArchived: Value(isArchived),
    updatedAt: Value(updatedAt),
  );
}

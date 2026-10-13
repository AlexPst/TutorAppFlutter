import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/features/subjects/domain/models/subject.dart';

extension SubjectRowMapper on SubjectRow {
  Subject toModel() => Subject(id: id, name: name);
}

import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';

extension LessonRowMapper on LessonRow {
  Lesson toModel() => Lesson(
    id: id,
    enrollmentId: enrollmentId,
    startsAt: startsAt,
    duration: Duration(minutes: durationMinutes),
    status: LessonStatus.values.byName(status),
    price: Money(priceKopecks),
    packageId: packageId,
    topic: topic,
    note: note,
  );
}

extension LessonDraftMapper on LessonDraft {
  LessonsCompanion toCompanion() => LessonsCompanion.insert(
    enrollmentId: enrollmentId,
    startsAt: startsAt,
    durationMinutes: duration.inMinutes,
    priceKopecks: price.kopecks,
    topic: Value(topic),
    note: Value(note),
  );
}

extension LessonMapper on Lesson {
  LessonsCompanion toUpdateCompanion(DateTime updatedAt) => LessonsCompanion(
    enrollmentId: Value(enrollmentId),
    startsAt: Value(startsAt),
    durationMinutes: Value(duration.inMinutes),
    status: Value(status.name),
    priceKopecks: Value(price.kopecks),
    packageId: Value(packageId),
    topic: Value(topic),
    note: Value(note),
    updatedAt: Value(updatedAt),
  );
}

import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/finance/domain/models/lesson_package.dart';

extension LessonPackageRowMapper on LessonPackageRow {
  LessonPackage toModel() => LessonPackage(
    id: id,
    enrollmentId: enrollmentId,
    lessonsCount: lessonsCount,
    price: Money(priceKopecks),
    purchasedAt: purchasedAt,
    note: note,
  );
}

extension LessonPackageDraftMapper on LessonPackageDraft {
  LessonPackagesCompanion toCompanion() => LessonPackagesCompanion.insert(
    enrollmentId: enrollmentId,
    lessonsCount: lessonsCount,
    priceKopecks: price.kopecks,
    purchasedAt: purchasedAt,
    note: Value(note),
  );
}

extension LessonPackageMapper on LessonPackage {
  /// Направление пакета не меняется.
  LessonPackagesCompanion toUpdateCompanion(DateTime updatedAt) =>
      LessonPackagesCompanion(
        lessonsCount: Value(lessonsCount),
        priceKopecks: Value(price.kopecks),
        purchasedAt: Value(purchasedAt),
        note: Value(note),
        updatedAt: Value(updatedAt),
      );
}

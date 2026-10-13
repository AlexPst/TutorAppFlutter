import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutor_app/core/domain/money.dart';

part 'lesson_package.freezed.dart';
part 'lesson_package.g.dart';

/// Пакет из нескольких занятий по направлению. Его цена целиком
/// начисляется ученику в момент оформления.
@freezed
abstract class LessonPackage with _$LessonPackage {
  @Assert('lessonsCount > 0', 'A package must contain at least one lesson')
  const factory LessonPackage({
    required int id,
    required int enrollmentId,
    required int lessonsCount,
    @MoneyConverter() required Money price,
    required DateTime purchasedAt,
    String? note,
  }) = _LessonPackage;

  factory LessonPackage.fromJson(Map<String, dynamic> json) =>
      _$LessonPackageFromJson(json);
}

/// Данные для оформления пакета.
@freezed
abstract class LessonPackageDraft with _$LessonPackageDraft {
  @Assert('lessonsCount > 0', 'A package must contain at least one lesson')
  const factory LessonPackageDraft({
    required int enrollmentId,
    required int lessonsCount,
    required Money price,
    required DateTime purchasedAt,
    String? note,
  }) = _LessonPackageDraft;
}

/// Пакет с числом уже списанных из него занятий.
@freezed
abstract class PackageWithUsage with _$PackageWithUsage {
  const factory PackageWithUsage({
    required LessonPackage package,
    required int usedLessons,
  }) = _PackageWithUsage;

  const PackageWithUsage._();

  int get remainingLessons => package.lessonsCount - usedLessons;

  bool get isExhausted => remainingLessons <= 0;
}

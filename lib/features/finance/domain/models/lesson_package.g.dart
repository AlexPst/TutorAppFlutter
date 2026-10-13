// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LessonPackage _$LessonPackageFromJson(Map<String, dynamic> json) =>
    _LessonPackage(
      id: (json['id'] as num).toInt(),
      enrollmentId: (json['enrollmentId'] as num).toInt(),
      lessonsCount: (json['lessonsCount'] as num).toInt(),
      price: const MoneyConverter().fromJson((json['price'] as num).toInt()),
      purchasedAt: DateTime.parse(json['purchasedAt'] as String),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$LessonPackageToJson(_LessonPackage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'enrollmentId': instance.enrollmentId,
      'lessonsCount': instance.lessonsCount,
      'price': const MoneyConverter().toJson(instance.price),
      'purchasedAt': instance.purchasedAt.toIso8601String(),
      'note': instance.note,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Lesson _$LessonFromJson(Map<String, dynamic> json) => _Lesson(
  id: (json['id'] as num).toInt(),
  enrollmentId: (json['enrollmentId'] as num).toInt(),
  startsAt: DateTime.parse(json['startsAt'] as String),
  duration: Duration(microseconds: (json['duration'] as num).toInt()),
  status:
      $enumDecodeNullable(_$LessonStatusEnumMap, json['status']) ??
      LessonStatus.planned,
  price: const MoneyConverter().fromJson((json['price'] as num).toInt()),
  packageId: (json['packageId'] as num?)?.toInt(),
  topic: json['topic'] as String?,
  note: json['note'] as String?,
);

Map<String, dynamic> _$LessonToJson(_Lesson instance) => <String, dynamic>{
  'id': instance.id,
  'enrollmentId': instance.enrollmentId,
  'startsAt': instance.startsAt.toIso8601String(),
  'duration': instance.duration.inMicroseconds,
  'status': _$LessonStatusEnumMap[instance.status]!,
  'price': const MoneyConverter().toJson(instance.price),
  'packageId': instance.packageId,
  'topic': instance.topic,
  'note': instance.note,
};

const _$LessonStatusEnumMap = {
  LessonStatus.planned: 'planned',
  LessonStatus.completed: 'completed',
  LessonStatus.cancelledByStudent: 'cancelledByStudent',
  LessonStatus.cancelledByTutor: 'cancelledByTutor',
  LessonStatus.noShow: 'noShow',
};

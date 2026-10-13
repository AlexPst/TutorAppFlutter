// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgressEntry _$ProgressEntryFromJson(Map<String, dynamic> json) =>
    _ProgressEntry(
      id: (json['id'] as num).toInt(),
      enrollmentId: (json['enrollmentId'] as num).toInt(),
      lessonId: (json['lessonId'] as num?)?.toInt(),
      date: DateTime.parse(json['date'] as String),
      topic: json['topic'] as String?,
      grade: (json['grade'] as num?)?.toInt(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$ProgressEntryToJson(_ProgressEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'enrollmentId': instance.enrollmentId,
      'lessonId': instance.lessonId,
      'date': instance.date.toIso8601String(),
      'topic': instance.topic,
      'grade': instance.grade,
      'note': instance.note,
    };

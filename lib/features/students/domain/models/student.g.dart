// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Student _$StudentFromJson(Map<String, dynamic> json) => _Student(
  id: (json['id'] as num).toInt(),
  fullName: json['fullName'] as String,
  phone: json['phone'] as String?,
  telegram: json['telegram'] as String?,
  note: json['note'] as String?,
  gradeScale: json['gradeScale'] == null
      ? GradeScale.fivePoint
      : GradeScale.fromJson(json['gradeScale'] as Map<String, dynamic>),
  isArchived: json['isArchived'] as bool? ?? false,
);

Map<String, dynamic> _$StudentToJson(_Student instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'phone': instance.phone,
  'telegram': instance.telegram,
  'note': instance.note,
  'gradeScale': instance.gradeScale.toJson(),
  'isArchived': instance.isArchived,
};

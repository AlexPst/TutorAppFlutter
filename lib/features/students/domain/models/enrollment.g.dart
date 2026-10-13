// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Enrollment _$EnrollmentFromJson(Map<String, dynamic> json) => _Enrollment(
  id: (json['id'] as num).toInt(),
  studentId: (json['studentId'] as num).toInt(),
  subjectId: (json['subjectId'] as num).toInt(),
  rate: const MoneyConverter().fromJson((json['rate'] as num).toInt()),
  defaultDuration: Duration(
    microseconds: (json['defaultDuration'] as num).toInt(),
  ),
  note: json['note'] as String?,
  isArchived: json['isArchived'] as bool? ?? false,
);

Map<String, dynamic> _$EnrollmentToJson(_Enrollment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'subjectId': instance.subjectId,
      'rate': const MoneyConverter().toJson(instance.rate),
      'defaultDuration': instance.defaultDuration.inMicroseconds,
      'note': instance.note,
      'isArchived': instance.isArchived,
    };

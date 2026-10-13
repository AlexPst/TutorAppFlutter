// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Payment _$PaymentFromJson(Map<String, dynamic> json) => _Payment(
  id: (json['id'] as num).toInt(),
  studentId: (json['studentId'] as num).toInt(),
  amount: const MoneyConverter().fromJson((json['amount'] as num).toInt()),
  paidAt: DateTime.parse(json['paidAt'] as String),
  method:
      $enumDecodeNullable(_$PaymentMethodEnumMap, json['method']) ??
      PaymentMethod.cardTransfer,
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$PaymentToJson(_Payment instance) => <String, dynamic>{
  'id': instance.id,
  'studentId': instance.studentId,
  'amount': const MoneyConverter().toJson(instance.amount),
  'paidAt': instance.paidAt.toIso8601String(),
  'method': _$PaymentMethodEnumMap[instance.method]!,
  'comment': instance.comment,
};

const _$PaymentMethodEnumMap = {
  PaymentMethod.cardTransfer: 'cardTransfer',
  PaymentMethod.cash: 'cash',
  PaymentMethod.other: 'other',
};

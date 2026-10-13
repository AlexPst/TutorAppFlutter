// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Payment {

 int get id; int get studentId;@MoneyConverter() Money get amount; DateTime get paidAt; PaymentMethod get method; String? get comment;
/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCopyWith<Payment> get copyWith => _$PaymentCopyWithImpl<Payment>(this as Payment, _$identity);

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Payment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Payment&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.studentId, _this.studentId) || other.studentId == _this.studentId)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.paidAt, _this.paidAt) || other.paidAt == _this.paidAt)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.comment, _this.comment) || other.comment == _this.comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Payment;
  return Object.hash(runtimeType,_this.id,_this.studentId,_this.amount,_this.paidAt,_this.method,_this.comment);
}

@override
String toString() {
  final _this = this as Payment;
  return 'Payment(id: ${_this.id}, studentId: ${_this.studentId}, amount: ${_this.amount}, paidAt: ${_this.paidAt}, method: ${_this.method}, comment: ${_this.comment})';
}


}

/// @nodoc
abstract mixin class $PaymentCopyWith<$Res>  {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) _then) = _$PaymentCopyWithImpl;
@useResult
$Res call({
 int id, int studentId,@MoneyConverter() Money amount, DateTime paidAt, PaymentMethod method, String? comment
});




}
/// @nodoc
class _$PaymentCopyWithImpl<$Res>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._self, this._then);

  final Payment _self;
  final $Res Function(Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? studentId = null,Object? amount = null,Object? paidAt = null,Object? method = null,Object? comment = freezed,}) {
  return _then(Payment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Payment].
extension PaymentPatterns on Payment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Payment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Payment value)  $default,){
final _that = this;
switch (_that) {
case _Payment():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Payment value)?  $default,){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int studentId, @MoneyConverter()  Money amount,  DateTime paidAt,  PaymentMethod method,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.studentId,_that.amount,_that.paidAt,_that.method,_that.comment);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int studentId, @MoneyConverter()  Money amount,  DateTime paidAt,  PaymentMethod method,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _Payment():
return $default(_that.id,_that.studentId,_that.amount,_that.paidAt,_that.method,_that.comment);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int studentId, @MoneyConverter()  Money amount,  DateTime paidAt,  PaymentMethod method,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.studentId,_that.amount,_that.paidAt,_that.method,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Payment implements Payment {
   _Payment({required this.id, required this.studentId, @MoneyConverter() required this.amount, required this.paidAt, this.method = PaymentMethod.cardTransfer, this.comment}): assert(amount.kopecks > 0, 'Payment amount must be positive');
  factory _Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

@override final  int id;
@override final  int studentId;
@override@MoneyConverter() final  Money amount;
@override final  DateTime paidAt;
@override@JsonKey() final  PaymentMethod method;
@override final  String? comment;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCopyWith<_Payment> get copyWith => __$PaymentCopyWithImpl<_Payment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.method, method) || other.method == method)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,studentId,amount,paidAt,method,comment);
}

@override
String toString() {
    return 'Payment(id: $id, studentId: $studentId, amount: $amount, paidAt: $paidAt, method: $method, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) _then) = __$PaymentCopyWithImpl;
@override @useResult
$Res call({
 int id, int studentId,@MoneyConverter() Money amount, DateTime paidAt, PaymentMethod method, String? comment
});




}
/// @nodoc
class __$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(this._self, this._then);

  final _Payment _self;
  final $Res Function(_Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? studentId = null,Object? amount = null,Object? paidAt = null,Object? method = null,Object? comment = freezed,}) {
  return _then(_Payment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$PaymentDraft {

 int get studentId; Money get amount; DateTime get paidAt; PaymentMethod get method; String? get comment;
/// Create a copy of PaymentDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentDraftCopyWith<PaymentDraft> get copyWith => _$PaymentDraftCopyWithImpl<PaymentDraft>(this as PaymentDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PaymentDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentDraft&&(identical(other.studentId, _this.studentId) || other.studentId == _this.studentId)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.paidAt, _this.paidAt) || other.paidAt == _this.paidAt)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.comment, _this.comment) || other.comment == _this.comment));
}


@override
int get hashCode {
  final _this = this as PaymentDraft;
  return Object.hash(runtimeType,_this.studentId,_this.amount,_this.paidAt,_this.method,_this.comment);
}

@override
String toString() {
  final _this = this as PaymentDraft;
  return 'PaymentDraft(studentId: ${_this.studentId}, amount: ${_this.amount}, paidAt: ${_this.paidAt}, method: ${_this.method}, comment: ${_this.comment})';
}


}

/// @nodoc
abstract mixin class $PaymentDraftCopyWith<$Res>  {
  factory $PaymentDraftCopyWith(PaymentDraft value, $Res Function(PaymentDraft) _then) = _$PaymentDraftCopyWithImpl;
@useResult
$Res call({
 int studentId, Money amount, DateTime paidAt, PaymentMethod method, String? comment
});




}
/// @nodoc
class _$PaymentDraftCopyWithImpl<$Res>
    implements $PaymentDraftCopyWith<$Res> {
  _$PaymentDraftCopyWithImpl(this._self, this._then);

  final PaymentDraft _self;
  final $Res Function(PaymentDraft) _then;

/// Create a copy of PaymentDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? studentId = null,Object? amount = null,Object? paidAt = null,Object? method = null,Object? comment = freezed,}) {
  return _then(PaymentDraft(
studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentDraft].
extension PaymentDraftPatterns on PaymentDraft {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentDraft() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentDraft value)  $default,){
final _that = this;
switch (_that) {
case _PaymentDraft():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentDraft value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentDraft() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int studentId,  Money amount,  DateTime paidAt,  PaymentMethod method,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentDraft() when $default != null:
return $default(_that.studentId,_that.amount,_that.paidAt,_that.method,_that.comment);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int studentId,  Money amount,  DateTime paidAt,  PaymentMethod method,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _PaymentDraft():
return $default(_that.studentId,_that.amount,_that.paidAt,_that.method,_that.comment);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int studentId,  Money amount,  DateTime paidAt,  PaymentMethod method,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _PaymentDraft() when $default != null:
return $default(_that.studentId,_that.amount,_that.paidAt,_that.method,_that.comment);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentDraft implements PaymentDraft {
   _PaymentDraft({required this.studentId, required this.amount, required this.paidAt, this.method = PaymentMethod.cardTransfer, this.comment}): assert(amount.kopecks > 0, 'Payment amount must be positive');
  

@override final  int studentId;
@override final  Money amount;
@override final  DateTime paidAt;
@override@JsonKey() final  PaymentMethod method;
@override final  String? comment;

/// Create a copy of PaymentDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentDraftCopyWith<_PaymentDraft> get copyWith => __$PaymentDraftCopyWithImpl<_PaymentDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentDraft&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.method, method) || other.method == method)&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode {
    return Object.hash(runtimeType,studentId,amount,paidAt,method,comment);
}

@override
String toString() {
    return 'PaymentDraft(studentId: $studentId, amount: $amount, paidAt: $paidAt, method: $method, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$PaymentDraftCopyWith<$Res> implements $PaymentDraftCopyWith<$Res> {
  factory _$PaymentDraftCopyWith(_PaymentDraft value, $Res Function(_PaymentDraft) _then) = __$PaymentDraftCopyWithImpl;
@override @useResult
$Res call({
 int studentId, Money amount, DateTime paidAt, PaymentMethod method, String? comment
});




}
/// @nodoc
class __$PaymentDraftCopyWithImpl<$Res>
    implements _$PaymentDraftCopyWith<$Res> {
  __$PaymentDraftCopyWithImpl(this._self, this._then);

  final _PaymentDraft _self;
  final $Res Function(_PaymentDraft) _then;

/// Create a copy of PaymentDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? studentId = null,Object? amount = null,Object? paidAt = null,Object? method = null,Object? comment = freezed,}) {
  return _then(_PaymentDraft(
studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money,paidAt: null == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as PaymentMethod,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$PaymentDetails {

 Payment get payment; String get studentName;
/// Create a copy of PaymentDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentDetailsCopyWith<PaymentDetails> get copyWith => _$PaymentDetailsCopyWithImpl<PaymentDetails>(this as PaymentDetails, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PaymentDetails;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentDetails&&(identical(other.payment, _this.payment) || other.payment == _this.payment)&&(identical(other.studentName, _this.studentName) || other.studentName == _this.studentName));
}


@override
int get hashCode {
  final _this = this as PaymentDetails;
  return Object.hash(runtimeType,_this.payment,_this.studentName);
}

@override
String toString() {
  final _this = this as PaymentDetails;
  return 'PaymentDetails(payment: ${_this.payment}, studentName: ${_this.studentName})';
}


}

/// @nodoc
abstract mixin class $PaymentDetailsCopyWith<$Res>  {
  factory $PaymentDetailsCopyWith(PaymentDetails value, $Res Function(PaymentDetails) _then) = _$PaymentDetailsCopyWithImpl;
@useResult
$Res call({
 Payment payment, String studentName
});


$PaymentCopyWith<$Res> get payment;

}
/// @nodoc
class _$PaymentDetailsCopyWithImpl<$Res>
    implements $PaymentDetailsCopyWith<$Res> {
  _$PaymentDetailsCopyWithImpl(this._self, this._then);

  final PaymentDetails _self;
  final $Res Function(PaymentDetails) _then;

/// Create a copy of PaymentDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? payment = null,Object? studentName = null,}) {
  return _then(PaymentDetails(
payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as Payment,studentName: null == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of PaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCopyWith<$Res> get payment {
  
  return $PaymentCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaymentDetails].
extension PaymentDetailsPatterns on PaymentDetails {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentDetails() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentDetails value)  $default,){
final _that = this;
switch (_that) {
case _PaymentDetails():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentDetails value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentDetails() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Payment payment,  String studentName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentDetails() when $default != null:
return $default(_that.payment,_that.studentName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Payment payment,  String studentName)  $default,) {final _that = this;
switch (_that) {
case _PaymentDetails():
return $default(_that.payment,_that.studentName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Payment payment,  String studentName)?  $default,) {final _that = this;
switch (_that) {
case _PaymentDetails() when $default != null:
return $default(_that.payment,_that.studentName);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentDetails implements PaymentDetails {
  const _PaymentDetails({required this.payment, required this.studentName});
  

@override final  Payment payment;
@override final  String studentName;

/// Create a copy of PaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentDetailsCopyWith<_PaymentDetails> get copyWith => __$PaymentDetailsCopyWithImpl<_PaymentDetails>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentDetails&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.studentName, studentName) || other.studentName == studentName));
}


@override
int get hashCode {
    return Object.hash(runtimeType,payment,studentName);
}

@override
String toString() {
    return 'PaymentDetails(payment: $payment, studentName: $studentName)';
}


}

/// @nodoc
abstract mixin class _$PaymentDetailsCopyWith<$Res> implements $PaymentDetailsCopyWith<$Res> {
  factory _$PaymentDetailsCopyWith(_PaymentDetails value, $Res Function(_PaymentDetails) _then) = __$PaymentDetailsCopyWithImpl;
@override @useResult
$Res call({
 Payment payment, String studentName
});


@override $PaymentCopyWith<$Res> get payment;

}
/// @nodoc
class __$PaymentDetailsCopyWithImpl<$Res>
    implements _$PaymentDetailsCopyWith<$Res> {
  __$PaymentDetailsCopyWithImpl(this._self, this._then);

  final _PaymentDetails _self;
  final $Res Function(_PaymentDetails) _then;

/// Create a copy of PaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? payment = null,Object? studentName = null,}) {
  return _then(_PaymentDetails(
payment: null == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as Payment,studentName: null == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of PaymentDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentCopyWith<$Res> get payment {
  
  return $PaymentCopyWith<$Res>(_self.payment, (value) {
    return _then(_self.copyWith(payment: value));
  });
}
}

// dart format on

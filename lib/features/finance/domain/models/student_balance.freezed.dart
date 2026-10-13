// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudentBalance {

 int get studentId; String get studentName; bool get isArchived;/// Занятия в оплачиваемых статусах, не списанные из пакета.
 Money get lessonsCharged;/// Цены оформленных пакетов.
 Money get packagesCharged; Money get paid; DateTime? get lastPaymentAt;
/// Create a copy of StudentBalance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentBalanceCopyWith<StudentBalance> get copyWith => _$StudentBalanceCopyWithImpl<StudentBalance>(this as StudentBalance, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StudentBalance;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentBalance&&(identical(other.studentId, _this.studentId) || other.studentId == _this.studentId)&&(identical(other.studentName, _this.studentName) || other.studentName == _this.studentName)&&(identical(other.isArchived, _this.isArchived) || other.isArchived == _this.isArchived)&&(identical(other.lessonsCharged, _this.lessonsCharged) || other.lessonsCharged == _this.lessonsCharged)&&(identical(other.packagesCharged, _this.packagesCharged) || other.packagesCharged == _this.packagesCharged)&&(identical(other.paid, _this.paid) || other.paid == _this.paid)&&(identical(other.lastPaymentAt, _this.lastPaymentAt) || other.lastPaymentAt == _this.lastPaymentAt));
}


@override
int get hashCode {
  final _this = this as StudentBalance;
  return Object.hash(runtimeType,_this.studentId,_this.studentName,_this.isArchived,_this.lessonsCharged,_this.packagesCharged,_this.paid,_this.lastPaymentAt);
}

@override
String toString() {
  final _this = this as StudentBalance;
  return 'StudentBalance(studentId: ${_this.studentId}, studentName: ${_this.studentName}, isArchived: ${_this.isArchived}, lessonsCharged: ${_this.lessonsCharged}, packagesCharged: ${_this.packagesCharged}, paid: ${_this.paid}, lastPaymentAt: ${_this.lastPaymentAt})';
}


}

/// @nodoc
abstract mixin class $StudentBalanceCopyWith<$Res>  {
  factory $StudentBalanceCopyWith(StudentBalance value, $Res Function(StudentBalance) _then) = _$StudentBalanceCopyWithImpl;
@useResult
$Res call({
 int studentId, String studentName, bool isArchived, Money lessonsCharged, Money packagesCharged, Money paid, DateTime? lastPaymentAt
});




}
/// @nodoc
class _$StudentBalanceCopyWithImpl<$Res>
    implements $StudentBalanceCopyWith<$Res> {
  _$StudentBalanceCopyWithImpl(this._self, this._then);

  final StudentBalance _self;
  final $Res Function(StudentBalance) _then;

/// Create a copy of StudentBalance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? studentId = null,Object? studentName = null,Object? isArchived = null,Object? lessonsCharged = null,Object? packagesCharged = null,Object? paid = null,Object? lastPaymentAt = freezed,}) {
  return _then(StudentBalance(
studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,studentName: null == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,lessonsCharged: null == lessonsCharged ? _self.lessonsCharged : lessonsCharged // ignore: cast_nullable_to_non_nullable
as Money,packagesCharged: null == packagesCharged ? _self.packagesCharged : packagesCharged // ignore: cast_nullable_to_non_nullable
as Money,paid: null == paid ? _self.paid : paid // ignore: cast_nullable_to_non_nullable
as Money,lastPaymentAt: freezed == lastPaymentAt ? _self.lastPaymentAt : lastPaymentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentBalance].
extension StudentBalancePatterns on StudentBalance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentBalance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentBalance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentBalance value)  $default,){
final _that = this;
switch (_that) {
case _StudentBalance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentBalance value)?  $default,){
final _that = this;
switch (_that) {
case _StudentBalance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int studentId,  String studentName,  bool isArchived,  Money lessonsCharged,  Money packagesCharged,  Money paid,  DateTime? lastPaymentAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentBalance() when $default != null:
return $default(_that.studentId,_that.studentName,_that.isArchived,_that.lessonsCharged,_that.packagesCharged,_that.paid,_that.lastPaymentAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int studentId,  String studentName,  bool isArchived,  Money lessonsCharged,  Money packagesCharged,  Money paid,  DateTime? lastPaymentAt)  $default,) {final _that = this;
switch (_that) {
case _StudentBalance():
return $default(_that.studentId,_that.studentName,_that.isArchived,_that.lessonsCharged,_that.packagesCharged,_that.paid,_that.lastPaymentAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int studentId,  String studentName,  bool isArchived,  Money lessonsCharged,  Money packagesCharged,  Money paid,  DateTime? lastPaymentAt)?  $default,) {final _that = this;
switch (_that) {
case _StudentBalance() when $default != null:
return $default(_that.studentId,_that.studentName,_that.isArchived,_that.lessonsCharged,_that.packagesCharged,_that.paid,_that.lastPaymentAt);case _:
  return null;

}
}

}

/// @nodoc


class _StudentBalance extends StudentBalance {
  const _StudentBalance({required this.studentId, required this.studentName, this.isArchived = false, this.lessonsCharged = Money.zero, this.packagesCharged = Money.zero, this.paid = Money.zero, this.lastPaymentAt}): super._();
  

@override final  int studentId;
@override final  String studentName;
@override@JsonKey() final  bool isArchived;
/// Занятия в оплачиваемых статусах, не списанные из пакета.
@override@JsonKey() final  Money lessonsCharged;
/// Цены оформленных пакетов.
@override@JsonKey() final  Money packagesCharged;
@override@JsonKey() final  Money paid;
@override final  DateTime? lastPaymentAt;

/// Create a copy of StudentBalance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentBalanceCopyWith<_StudentBalance> get copyWith => __$StudentBalanceCopyWithImpl<_StudentBalance>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentBalance&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.studentName, studentName) || other.studentName == studentName)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.lessonsCharged, lessonsCharged) || other.lessonsCharged == lessonsCharged)&&(identical(other.packagesCharged, packagesCharged) || other.packagesCharged == packagesCharged)&&(identical(other.paid, paid) || other.paid == paid)&&(identical(other.lastPaymentAt, lastPaymentAt) || other.lastPaymentAt == lastPaymentAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,studentId,studentName,isArchived,lessonsCharged,packagesCharged,paid,lastPaymentAt);
}

@override
String toString() {
    return 'StudentBalance(studentId: $studentId, studentName: $studentName, isArchived: $isArchived, lessonsCharged: $lessonsCharged, packagesCharged: $packagesCharged, paid: $paid, lastPaymentAt: $lastPaymentAt)';
}


}

/// @nodoc
abstract mixin class _$StudentBalanceCopyWith<$Res> implements $StudentBalanceCopyWith<$Res> {
  factory _$StudentBalanceCopyWith(_StudentBalance value, $Res Function(_StudentBalance) _then) = __$StudentBalanceCopyWithImpl;
@override @useResult
$Res call({
 int studentId, String studentName, bool isArchived, Money lessonsCharged, Money packagesCharged, Money paid, DateTime? lastPaymentAt
});




}
/// @nodoc
class __$StudentBalanceCopyWithImpl<$Res>
    implements _$StudentBalanceCopyWith<$Res> {
  __$StudentBalanceCopyWithImpl(this._self, this._then);

  final _StudentBalance _self;
  final $Res Function(_StudentBalance) _then;

/// Create a copy of StudentBalance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? studentId = null,Object? studentName = null,Object? isArchived = null,Object? lessonsCharged = null,Object? packagesCharged = null,Object? paid = null,Object? lastPaymentAt = freezed,}) {
  return _then(_StudentBalance(
studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,studentName: null == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,lessonsCharged: null == lessonsCharged ? _self.lessonsCharged : lessonsCharged // ignore: cast_nullable_to_non_nullable
as Money,packagesCharged: null == packagesCharged ? _self.packagesCharged : packagesCharged // ignore: cast_nullable_to_non_nullable
as Money,paid: null == paid ? _self.paid : paid // ignore: cast_nullable_to_non_nullable
as Money,lastPaymentAt: freezed == lastPaymentAt ? _self.lastPaymentAt : lastPaymentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

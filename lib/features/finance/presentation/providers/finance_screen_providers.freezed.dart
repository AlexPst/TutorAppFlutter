// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finance_screen_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentsFilter {

 int? get studentId;/// `null` — за всё время.
 PeriodKind? get kind; DateTime get date;
/// Create a copy of PaymentsFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentsFilterCopyWith<PaymentsFilter> get copyWith => _$PaymentsFilterCopyWithImpl<PaymentsFilter>(this as PaymentsFilter, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PaymentsFilter;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentsFilter&&(identical(other.studentId, _this.studentId) || other.studentId == _this.studentId)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.date, _this.date) || other.date == _this.date));
}


@override
int get hashCode {
  final _this = this as PaymentsFilter;
  return Object.hash(runtimeType,_this.studentId,_this.kind,_this.date);
}

@override
String toString() {
  final _this = this as PaymentsFilter;
  return 'PaymentsFilter(studentId: ${_this.studentId}, kind: ${_this.kind}, date: ${_this.date})';
}


}

/// @nodoc
abstract mixin class $PaymentsFilterCopyWith<$Res>  {
  factory $PaymentsFilterCopyWith(PaymentsFilter value, $Res Function(PaymentsFilter) _then) = _$PaymentsFilterCopyWithImpl;
@useResult
$Res call({
 int? studentId, PeriodKind? kind, DateTime date
});




}
/// @nodoc
class _$PaymentsFilterCopyWithImpl<$Res>
    implements $PaymentsFilterCopyWith<$Res> {
  _$PaymentsFilterCopyWithImpl(this._self, this._then);

  final PaymentsFilter _self;
  final $Res Function(PaymentsFilter) _then;

/// Create a copy of PaymentsFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? studentId = freezed,Object? kind = freezed,Object? date = null,}) {
  return _then(PaymentsFilter(
studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PeriodKind?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentsFilter].
extension PaymentsFilterPatterns on PaymentsFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentsFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentsFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentsFilter value)  $default,){
final _that = this;
switch (_that) {
case _PaymentsFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentsFilter value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentsFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? studentId,  PeriodKind? kind,  DateTime date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentsFilter() when $default != null:
return $default(_that.studentId,_that.kind,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? studentId,  PeriodKind? kind,  DateTime date)  $default,) {final _that = this;
switch (_that) {
case _PaymentsFilter():
return $default(_that.studentId,_that.kind,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? studentId,  PeriodKind? kind,  DateTime date)?  $default,) {final _that = this;
switch (_that) {
case _PaymentsFilter() when $default != null:
return $default(_that.studentId,_that.kind,_that.date);case _:
  return null;

}
}

}

/// @nodoc


class _PaymentsFilter extends PaymentsFilter {
  const _PaymentsFilter({this.studentId, this.kind, required this.date}): super._();
  

@override final  int? studentId;
/// `null` — за всё время.
@override final  PeriodKind? kind;
@override final  DateTime date;

/// Create a copy of PaymentsFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentsFilterCopyWith<_PaymentsFilter> get copyWith => __$PaymentsFilterCopyWithImpl<_PaymentsFilter>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentsFilter&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode {
    return Object.hash(runtimeType,studentId,kind,date);
}

@override
String toString() {
    return 'PaymentsFilter(studentId: $studentId, kind: $kind, date: $date)';
}


}

/// @nodoc
abstract mixin class _$PaymentsFilterCopyWith<$Res> implements $PaymentsFilterCopyWith<$Res> {
  factory _$PaymentsFilterCopyWith(_PaymentsFilter value, $Res Function(_PaymentsFilter) _then) = __$PaymentsFilterCopyWithImpl;
@override @useResult
$Res call({
 int? studentId, PeriodKind? kind, DateTime date
});




}
/// @nodoc
class __$PaymentsFilterCopyWithImpl<$Res>
    implements _$PaymentsFilterCopyWith<$Res> {
  __$PaymentsFilterCopyWithImpl(this._self, this._then);

  final _PaymentsFilter _self;
  final $Res Function(_PaymentsFilter) _then;

/// Create a copy of PaymentsFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? studentId = freezed,Object? kind = freezed,Object? date = null,}) {
  return _then(_PaymentsFilter(
studentId: freezed == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PeriodKind?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

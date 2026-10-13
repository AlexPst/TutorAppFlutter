// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lessons_calendar_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LessonsCalendarState {

 PeriodKind get mode; DateTime get selectedDay;
/// Create a copy of LessonsCalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonsCalendarStateCopyWith<LessonsCalendarState> get copyWith => _$LessonsCalendarStateCopyWithImpl<LessonsCalendarState>(this as LessonsCalendarState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LessonsCalendarState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonsCalendarState&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.selectedDay, _this.selectedDay) || other.selectedDay == _this.selectedDay));
}


@override
int get hashCode {
  final _this = this as LessonsCalendarState;
  return Object.hash(runtimeType,_this.mode,_this.selectedDay);
}

@override
String toString() {
  final _this = this as LessonsCalendarState;
  return 'LessonsCalendarState(mode: ${_this.mode}, selectedDay: ${_this.selectedDay})';
}


}

/// @nodoc
abstract mixin class $LessonsCalendarStateCopyWith<$Res>  {
  factory $LessonsCalendarStateCopyWith(LessonsCalendarState value, $Res Function(LessonsCalendarState) _then) = _$LessonsCalendarStateCopyWithImpl;
@useResult
$Res call({
 PeriodKind mode, DateTime selectedDay
});




}
/// @nodoc
class _$LessonsCalendarStateCopyWithImpl<$Res>
    implements $LessonsCalendarStateCopyWith<$Res> {
  _$LessonsCalendarStateCopyWithImpl(this._self, this._then);

  final LessonsCalendarState _self;
  final $Res Function(LessonsCalendarState) _then;

/// Create a copy of LessonsCalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? selectedDay = null,}) {
  return _then(LessonsCalendarState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as PeriodKind,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [LessonsCalendarState].
extension LessonsCalendarStatePatterns on LessonsCalendarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LessonsCalendarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LessonsCalendarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LessonsCalendarState value)  $default,){
final _that = this;
switch (_that) {
case _LessonsCalendarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LessonsCalendarState value)?  $default,){
final _that = this;
switch (_that) {
case _LessonsCalendarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PeriodKind mode,  DateTime selectedDay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonsCalendarState() when $default != null:
return $default(_that.mode,_that.selectedDay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PeriodKind mode,  DateTime selectedDay)  $default,) {final _that = this;
switch (_that) {
case _LessonsCalendarState():
return $default(_that.mode,_that.selectedDay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PeriodKind mode,  DateTime selectedDay)?  $default,) {final _that = this;
switch (_that) {
case _LessonsCalendarState() when $default != null:
return $default(_that.mode,_that.selectedDay);case _:
  return null;

}
}

}

/// @nodoc


class _LessonsCalendarState extends LessonsCalendarState {
  const _LessonsCalendarState({required this.mode, required this.selectedDay}): super._();
  

@override final  PeriodKind mode;
@override final  DateTime selectedDay;

/// Create a copy of LessonsCalendarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonsCalendarStateCopyWith<_LessonsCalendarState> get copyWith => __$LessonsCalendarStateCopyWithImpl<_LessonsCalendarState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonsCalendarState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,selectedDay);
}

@override
String toString() {
    return 'LessonsCalendarState(mode: $mode, selectedDay: $selectedDay)';
}


}

/// @nodoc
abstract mixin class _$LessonsCalendarStateCopyWith<$Res> implements $LessonsCalendarStateCopyWith<$Res> {
  factory _$LessonsCalendarStateCopyWith(_LessonsCalendarState value, $Res Function(_LessonsCalendarState) _then) = __$LessonsCalendarStateCopyWithImpl;
@override @useResult
$Res call({
 PeriodKind mode, DateTime selectedDay
});




}
/// @nodoc
class __$LessonsCalendarStateCopyWithImpl<$Res>
    implements _$LessonsCalendarStateCopyWith<$Res> {
  __$LessonsCalendarStateCopyWithImpl(this._self, this._then);

  final _LessonsCalendarState _self;
  final $Res Function(_LessonsCalendarState) _then;

/// Create a copy of LessonsCalendarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? selectedDay = null,}) {
  return _then(_LessonsCalendarState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as PeriodKind,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

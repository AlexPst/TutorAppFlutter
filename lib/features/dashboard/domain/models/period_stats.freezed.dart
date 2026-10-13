// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'period_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PeriodStats {

 DatePeriod get period; Map<LessonStatus, int> get lessonsByStatus; Duration get completedDuration; Money get lessonsCharged; Money get packagesSold; Money get received;
/// Create a copy of PeriodStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeriodStatsCopyWith<PeriodStats> get copyWith => _$PeriodStatsCopyWithImpl<PeriodStats>(this as PeriodStats, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PeriodStats;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeriodStats&&(identical(other.period, _this.period) || other.period == _this.period)&&const DeepCollectionEquality().equals(other.lessonsByStatus, _this.lessonsByStatus)&&(identical(other.completedDuration, _this.completedDuration) || other.completedDuration == _this.completedDuration)&&(identical(other.lessonsCharged, _this.lessonsCharged) || other.lessonsCharged == _this.lessonsCharged)&&(identical(other.packagesSold, _this.packagesSold) || other.packagesSold == _this.packagesSold)&&(identical(other.received, _this.received) || other.received == _this.received));
}


@override
int get hashCode {
  final _this = this as PeriodStats;
  return Object.hash(runtimeType,_this.period,const DeepCollectionEquality().hash(_this.lessonsByStatus),_this.completedDuration,_this.lessonsCharged,_this.packagesSold,_this.received);
}

@override
String toString() {
  final _this = this as PeriodStats;
  return 'PeriodStats(period: ${_this.period}, lessonsByStatus: ${_this.lessonsByStatus}, completedDuration: ${_this.completedDuration}, lessonsCharged: ${_this.lessonsCharged}, packagesSold: ${_this.packagesSold}, received: ${_this.received})';
}


}

/// @nodoc
abstract mixin class $PeriodStatsCopyWith<$Res>  {
  factory $PeriodStatsCopyWith(PeriodStats value, $Res Function(PeriodStats) _then) = _$PeriodStatsCopyWithImpl;
@useResult
$Res call({
 DatePeriod period, Map<LessonStatus, int> lessonsByStatus, Duration completedDuration, Money lessonsCharged, Money packagesSold, Money received
});




}
/// @nodoc
class _$PeriodStatsCopyWithImpl<$Res>
    implements $PeriodStatsCopyWith<$Res> {
  _$PeriodStatsCopyWithImpl(this._self, this._then);

  final PeriodStats _self;
  final $Res Function(PeriodStats) _then;

/// Create a copy of PeriodStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? lessonsByStatus = null,Object? completedDuration = null,Object? lessonsCharged = null,Object? packagesSold = null,Object? received = null,}) {
  return _then(PeriodStats(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as DatePeriod,lessonsByStatus: null == lessonsByStatus ? _self.lessonsByStatus : lessonsByStatus // ignore: cast_nullable_to_non_nullable
as Map<LessonStatus, int>,completedDuration: null == completedDuration ? _self.completedDuration : completedDuration // ignore: cast_nullable_to_non_nullable
as Duration,lessonsCharged: null == lessonsCharged ? _self.lessonsCharged : lessonsCharged // ignore: cast_nullable_to_non_nullable
as Money,packagesSold: null == packagesSold ? _self.packagesSold : packagesSold // ignore: cast_nullable_to_non_nullable
as Money,received: null == received ? _self.received : received // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

}


/// Adds pattern-matching-related methods to [PeriodStats].
extension PeriodStatsPatterns on PeriodStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PeriodStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PeriodStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PeriodStats value)  $default,){
final _that = this;
switch (_that) {
case _PeriodStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PeriodStats value)?  $default,){
final _that = this;
switch (_that) {
case _PeriodStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DatePeriod period,  Map<LessonStatus, int> lessonsByStatus,  Duration completedDuration,  Money lessonsCharged,  Money packagesSold,  Money received)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PeriodStats() when $default != null:
return $default(_that.period,_that.lessonsByStatus,_that.completedDuration,_that.lessonsCharged,_that.packagesSold,_that.received);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DatePeriod period,  Map<LessonStatus, int> lessonsByStatus,  Duration completedDuration,  Money lessonsCharged,  Money packagesSold,  Money received)  $default,) {final _that = this;
switch (_that) {
case _PeriodStats():
return $default(_that.period,_that.lessonsByStatus,_that.completedDuration,_that.lessonsCharged,_that.packagesSold,_that.received);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DatePeriod period,  Map<LessonStatus, int> lessonsByStatus,  Duration completedDuration,  Money lessonsCharged,  Money packagesSold,  Money received)?  $default,) {final _that = this;
switch (_that) {
case _PeriodStats() when $default != null:
return $default(_that.period,_that.lessonsByStatus,_that.completedDuration,_that.lessonsCharged,_that.packagesSold,_that.received);case _:
  return null;

}
}

}

/// @nodoc


class _PeriodStats extends PeriodStats {
  const _PeriodStats({required this.period, required  Map<LessonStatus, int> lessonsByStatus, required this.completedDuration, required this.lessonsCharged, required this.packagesSold, required this.received}): _lessonsByStatus = lessonsByStatus,super._();
  

@override final  DatePeriod period;
 final  Map<LessonStatus, int> _lessonsByStatus;
@override Map<LessonStatus, int> get lessonsByStatus {
  if (_lessonsByStatus is EqualUnmodifiableMapView) return _lessonsByStatus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_lessonsByStatus);
}

@override final  Duration completedDuration;
@override final  Money lessonsCharged;
@override final  Money packagesSold;
@override final  Money received;

/// Create a copy of PeriodStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeriodStatsCopyWith<_PeriodStats> get copyWith => __$PeriodStatsCopyWithImpl<_PeriodStats>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PeriodStats&&(identical(other.period, period) || other.period == period)&&const DeepCollectionEquality().equals(other.lessonsByStatus, _lessonsByStatus)&&(identical(other.completedDuration, completedDuration) || other.completedDuration == completedDuration)&&(identical(other.lessonsCharged, lessonsCharged) || other.lessonsCharged == lessonsCharged)&&(identical(other.packagesSold, packagesSold) || other.packagesSold == packagesSold)&&(identical(other.received, received) || other.received == received));
}


@override
int get hashCode {
    return Object.hash(runtimeType,period,const DeepCollectionEquality().hash(_lessonsByStatus),completedDuration,lessonsCharged,packagesSold,received);
}

@override
String toString() {
    return 'PeriodStats(period: $period, lessonsByStatus: $lessonsByStatus, completedDuration: $completedDuration, lessonsCharged: $lessonsCharged, packagesSold: $packagesSold, received: $received)';
}


}

/// @nodoc
abstract mixin class _$PeriodStatsCopyWith<$Res> implements $PeriodStatsCopyWith<$Res> {
  factory _$PeriodStatsCopyWith(_PeriodStats value, $Res Function(_PeriodStats) _then) = __$PeriodStatsCopyWithImpl;
@override @useResult
$Res call({
 DatePeriod period, Map<LessonStatus, int> lessonsByStatus, Duration completedDuration, Money lessonsCharged, Money packagesSold, Money received
});




}
/// @nodoc
class __$PeriodStatsCopyWithImpl<$Res>
    implements _$PeriodStatsCopyWith<$Res> {
  __$PeriodStatsCopyWithImpl(this._self, this._then);

  final _PeriodStats _self;
  final $Res Function(_PeriodStats) _then;

/// Create a copy of PeriodStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? lessonsByStatus = null,Object? completedDuration = null,Object? lessonsCharged = null,Object? packagesSold = null,Object? received = null,}) {
  return _then(_PeriodStats(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as DatePeriod,lessonsByStatus: null == lessonsByStatus ? _self._lessonsByStatus : lessonsByStatus // ignore: cast_nullable_to_non_nullable
as Map<LessonStatus, int>,completedDuration: null == completedDuration ? _self.completedDuration : completedDuration // ignore: cast_nullable_to_non_nullable
as Duration,lessonsCharged: null == lessonsCharged ? _self.lessonsCharged : lessonsCharged // ignore: cast_nullable_to_non_nullable
as Money,packagesSold: null == packagesSold ? _self.packagesSold : packagesSold // ignore: cast_nullable_to_non_nullable
as Money,received: null == received ? _self.received : received // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}


}

// dart format on

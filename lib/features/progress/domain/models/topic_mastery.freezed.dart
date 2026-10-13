// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_mastery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TopicMastery {

/// Написание из самой свежей записи.
 String get topic; DateTime get lastDate;/// Записей по теме: занятий и самостоятельных записей.
 int get entriesCount; int? get lastGrade; double? get averageGrade; int get gradesCount;
/// Create a copy of TopicMastery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicMasteryCopyWith<TopicMastery> get copyWith => _$TopicMasteryCopyWithImpl<TopicMastery>(this as TopicMastery, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TopicMastery;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicMastery&&(identical(other.topic, _this.topic) || other.topic == _this.topic)&&(identical(other.lastDate, _this.lastDate) || other.lastDate == _this.lastDate)&&(identical(other.entriesCount, _this.entriesCount) || other.entriesCount == _this.entriesCount)&&(identical(other.lastGrade, _this.lastGrade) || other.lastGrade == _this.lastGrade)&&(identical(other.averageGrade, _this.averageGrade) || other.averageGrade == _this.averageGrade)&&(identical(other.gradesCount, _this.gradesCount) || other.gradesCount == _this.gradesCount));
}


@override
int get hashCode {
  final _this = this as TopicMastery;
  return Object.hash(runtimeType,_this.topic,_this.lastDate,_this.entriesCount,_this.lastGrade,_this.averageGrade,_this.gradesCount);
}

@override
String toString() {
  final _this = this as TopicMastery;
  return 'TopicMastery(topic: ${_this.topic}, lastDate: ${_this.lastDate}, entriesCount: ${_this.entriesCount}, lastGrade: ${_this.lastGrade}, averageGrade: ${_this.averageGrade}, gradesCount: ${_this.gradesCount})';
}


}

/// @nodoc
abstract mixin class $TopicMasteryCopyWith<$Res>  {
  factory $TopicMasteryCopyWith(TopicMastery value, $Res Function(TopicMastery) _then) = _$TopicMasteryCopyWithImpl;
@useResult
$Res call({
 String topic, DateTime lastDate, int entriesCount, int? lastGrade, double? averageGrade, int gradesCount
});




}
/// @nodoc
class _$TopicMasteryCopyWithImpl<$Res>
    implements $TopicMasteryCopyWith<$Res> {
  _$TopicMasteryCopyWithImpl(this._self, this._then);

  final TopicMastery _self;
  final $Res Function(TopicMastery) _then;

/// Create a copy of TopicMastery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topic = null,Object? lastDate = null,Object? entriesCount = null,Object? lastGrade = freezed,Object? averageGrade = freezed,Object? gradesCount = null,}) {
  return _then(TopicMastery(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,lastDate: null == lastDate ? _self.lastDate : lastDate // ignore: cast_nullable_to_non_nullable
as DateTime,entriesCount: null == entriesCount ? _self.entriesCount : entriesCount // ignore: cast_nullable_to_non_nullable
as int,lastGrade: freezed == lastGrade ? _self.lastGrade : lastGrade // ignore: cast_nullable_to_non_nullable
as int?,averageGrade: freezed == averageGrade ? _self.averageGrade : averageGrade // ignore: cast_nullable_to_non_nullable
as double?,gradesCount: null == gradesCount ? _self.gradesCount : gradesCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TopicMastery].
extension TopicMasteryPatterns on TopicMastery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicMastery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicMastery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicMastery value)  $default,){
final _that = this;
switch (_that) {
case _TopicMastery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicMastery value)?  $default,){
final _that = this;
switch (_that) {
case _TopicMastery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String topic,  DateTime lastDate,  int entriesCount,  int? lastGrade,  double? averageGrade,  int gradesCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicMastery() when $default != null:
return $default(_that.topic,_that.lastDate,_that.entriesCount,_that.lastGrade,_that.averageGrade,_that.gradesCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String topic,  DateTime lastDate,  int entriesCount,  int? lastGrade,  double? averageGrade,  int gradesCount)  $default,) {final _that = this;
switch (_that) {
case _TopicMastery():
return $default(_that.topic,_that.lastDate,_that.entriesCount,_that.lastGrade,_that.averageGrade,_that.gradesCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String topic,  DateTime lastDate,  int entriesCount,  int? lastGrade,  double? averageGrade,  int gradesCount)?  $default,) {final _that = this;
switch (_that) {
case _TopicMastery() when $default != null:
return $default(_that.topic,_that.lastDate,_that.entriesCount,_that.lastGrade,_that.averageGrade,_that.gradesCount);case _:
  return null;

}
}

}

/// @nodoc


class _TopicMastery implements TopicMastery {
  const _TopicMastery({required this.topic, required this.lastDate, required this.entriesCount, this.lastGrade, this.averageGrade, this.gradesCount = 0});
  

/// Написание из самой свежей записи.
@override final  String topic;
@override final  DateTime lastDate;
/// Записей по теме: занятий и самостоятельных записей.
@override final  int entriesCount;
@override final  int? lastGrade;
@override final  double? averageGrade;
@override@JsonKey() final  int gradesCount;

/// Create a copy of TopicMastery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicMasteryCopyWith<_TopicMastery> get copyWith => __$TopicMasteryCopyWithImpl<_TopicMastery>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicMastery&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.lastDate, lastDate) || other.lastDate == lastDate)&&(identical(other.entriesCount, entriesCount) || other.entriesCount == entriesCount)&&(identical(other.lastGrade, lastGrade) || other.lastGrade == lastGrade)&&(identical(other.averageGrade, averageGrade) || other.averageGrade == averageGrade)&&(identical(other.gradesCount, gradesCount) || other.gradesCount == gradesCount));
}


@override
int get hashCode {
    return Object.hash(runtimeType,topic,lastDate,entriesCount,lastGrade,averageGrade,gradesCount);
}

@override
String toString() {
    return 'TopicMastery(topic: $topic, lastDate: $lastDate, entriesCount: $entriesCount, lastGrade: $lastGrade, averageGrade: $averageGrade, gradesCount: $gradesCount)';
}


}

/// @nodoc
abstract mixin class _$TopicMasteryCopyWith<$Res> implements $TopicMasteryCopyWith<$Res> {
  factory _$TopicMasteryCopyWith(_TopicMastery value, $Res Function(_TopicMastery) _then) = __$TopicMasteryCopyWithImpl;
@override @useResult
$Res call({
 String topic, DateTime lastDate, int entriesCount, int? lastGrade, double? averageGrade, int gradesCount
});




}
/// @nodoc
class __$TopicMasteryCopyWithImpl<$Res>
    implements _$TopicMasteryCopyWith<$Res> {
  __$TopicMasteryCopyWithImpl(this._self, this._then);

  final _TopicMastery _self;
  final $Res Function(_TopicMastery) _then;

/// Create a copy of TopicMastery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topic = null,Object? lastDate = null,Object? entriesCount = null,Object? lastGrade = freezed,Object? averageGrade = freezed,Object? gradesCount = null,}) {
  return _then(_TopicMastery(
topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,lastDate: null == lastDate ? _self.lastDate : lastDate // ignore: cast_nullable_to_non_nullable
as DateTime,entriesCount: null == entriesCount ? _self.entriesCount : entriesCount // ignore: cast_nullable_to_non_nullable
as int,lastGrade: freezed == lastGrade ? _self.lastGrade : lastGrade // ignore: cast_nullable_to_non_nullable
as int?,averageGrade: freezed == averageGrade ? _self.averageGrade : averageGrade // ignore: cast_nullable_to_non_nullable
as double?,gradesCount: null == gradesCount ? _self.gradesCount : gradesCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

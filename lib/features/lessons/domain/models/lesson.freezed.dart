// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Lesson {

 int get id; int get enrollmentId; DateTime get startsAt; Duration get duration; LessonStatus get status;/// Стоимость занятия. Фиксируется при создании, чтобы смена ставки
/// направления не меняла прошлые занятия.
@MoneyConverter() Money get price;/// Пакет, из которого списано занятие. Задаётся только для оплачиваемых
/// статусов.
 int? get packageId; String? get topic; String? get note;
/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonCopyWith<Lesson> get copyWith => _$LessonCopyWithImpl<Lesson>(this as Lesson, _$identity);

  /// Serializes this Lesson to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Lesson;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Lesson&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.enrollmentId, _this.enrollmentId) || other.enrollmentId == _this.enrollmentId)&&(identical(other.startsAt, _this.startsAt) || other.startsAt == _this.startsAt)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.packageId, _this.packageId) || other.packageId == _this.packageId)&&(identical(other.topic, _this.topic) || other.topic == _this.topic)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Lesson;
  return Object.hash(runtimeType,_this.id,_this.enrollmentId,_this.startsAt,_this.duration,_this.status,_this.price,_this.packageId,_this.topic,_this.note);
}

@override
String toString() {
  final _this = this as Lesson;
  return 'Lesson(id: ${_this.id}, enrollmentId: ${_this.enrollmentId}, startsAt: ${_this.startsAt}, duration: ${_this.duration}, status: ${_this.status}, price: ${_this.price}, packageId: ${_this.packageId}, topic: ${_this.topic}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $LessonCopyWith<$Res>  {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) _then) = _$LessonCopyWithImpl;
@useResult
$Res call({
 int id, int enrollmentId, DateTime startsAt, Duration duration, LessonStatus status,@MoneyConverter() Money price, int? packageId, String? topic, String? note
});




}
/// @nodoc
class _$LessonCopyWithImpl<$Res>
    implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._self, this._then);

  final Lesson _self;
  final $Res Function(Lesson) _then;

/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? enrollmentId = null,Object? startsAt = null,Object? duration = null,Object? status = null,Object? price = null,Object? packageId = freezed,Object? topic = freezed,Object? note = freezed,}) {
  return _then(Lesson(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,enrollmentId: null == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as int,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LessonStatus,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,packageId: freezed == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int?,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Lesson].
extension LessonPatterns on Lesson {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Lesson value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Lesson() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Lesson value)  $default,){
final _that = this;
switch (_that) {
case _Lesson():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Lesson value)?  $default,){
final _that = this;
switch (_that) {
case _Lesson() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int enrollmentId,  DateTime startsAt,  Duration duration,  LessonStatus status, @MoneyConverter()  Money price,  int? packageId,  String? topic,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Lesson() when $default != null:
return $default(_that.id,_that.enrollmentId,_that.startsAt,_that.duration,_that.status,_that.price,_that.packageId,_that.topic,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int enrollmentId,  DateTime startsAt,  Duration duration,  LessonStatus status, @MoneyConverter()  Money price,  int? packageId,  String? topic,  String? note)  $default,) {final _that = this;
switch (_that) {
case _Lesson():
return $default(_that.id,_that.enrollmentId,_that.startsAt,_that.duration,_that.status,_that.price,_that.packageId,_that.topic,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int enrollmentId,  DateTime startsAt,  Duration duration,  LessonStatus status, @MoneyConverter()  Money price,  int? packageId,  String? topic,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _Lesson() when $default != null:
return $default(_that.id,_that.enrollmentId,_that.startsAt,_that.duration,_that.status,_that.price,_that.packageId,_that.topic,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Lesson extends Lesson {
  const _Lesson({required this.id, required this.enrollmentId, required this.startsAt, required this.duration, this.status = LessonStatus.planned, @MoneyConverter() required this.price, this.packageId, this.topic, this.note}): super._();
  factory _Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

@override final  int id;
@override final  int enrollmentId;
@override final  DateTime startsAt;
@override final  Duration duration;
@override@JsonKey() final  LessonStatus status;
/// Стоимость занятия. Фиксируется при создании, чтобы смена ставки
/// направления не меняла прошлые занятия.
@override@MoneyConverter() final  Money price;
/// Пакет, из которого списано занятие. Задаётся только для оплачиваемых
/// статусов.
@override final  int? packageId;
@override final  String? topic;
@override final  String? note;

/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonCopyWith<_Lesson> get copyWith => __$LessonCopyWithImpl<_Lesson>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LessonToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Lesson&&(identical(other.id, id) || other.id == id)&&(identical(other.enrollmentId, enrollmentId) || other.enrollmentId == enrollmentId)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,enrollmentId,startsAt,duration,status,price,packageId,topic,note);
}

@override
String toString() {
    return 'Lesson(id: $id, enrollmentId: $enrollmentId, startsAt: $startsAt, duration: $duration, status: $status, price: $price, packageId: $packageId, topic: $topic, note: $note)';
}


}

/// @nodoc
abstract mixin class _$LessonCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$LessonCopyWith(_Lesson value, $Res Function(_Lesson) _then) = __$LessonCopyWithImpl;
@override @useResult
$Res call({
 int id, int enrollmentId, DateTime startsAt, Duration duration, LessonStatus status,@MoneyConverter() Money price, int? packageId, String? topic, String? note
});




}
/// @nodoc
class __$LessonCopyWithImpl<$Res>
    implements _$LessonCopyWith<$Res> {
  __$LessonCopyWithImpl(this._self, this._then);

  final _Lesson _self;
  final $Res Function(_Lesson) _then;

/// Create a copy of Lesson
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? enrollmentId = null,Object? startsAt = null,Object? duration = null,Object? status = null,Object? price = null,Object? packageId = freezed,Object? topic = freezed,Object? note = freezed,}) {
  return _then(_Lesson(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,enrollmentId: null == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as int,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LessonStatus,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,packageId: freezed == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int?,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$LessonDraft {

 int get enrollmentId; DateTime get startsAt; Duration get duration; Money get price; String? get topic; String? get note;
/// Create a copy of LessonDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonDraftCopyWith<LessonDraft> get copyWith => _$LessonDraftCopyWithImpl<LessonDraft>(this as LessonDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LessonDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonDraft&&(identical(other.enrollmentId, _this.enrollmentId) || other.enrollmentId == _this.enrollmentId)&&(identical(other.startsAt, _this.startsAt) || other.startsAt == _this.startsAt)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.topic, _this.topic) || other.topic == _this.topic)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as LessonDraft;
  return Object.hash(runtimeType,_this.enrollmentId,_this.startsAt,_this.duration,_this.price,_this.topic,_this.note);
}

@override
String toString() {
  final _this = this as LessonDraft;
  return 'LessonDraft(enrollmentId: ${_this.enrollmentId}, startsAt: ${_this.startsAt}, duration: ${_this.duration}, price: ${_this.price}, topic: ${_this.topic}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $LessonDraftCopyWith<$Res>  {
  factory $LessonDraftCopyWith(LessonDraft value, $Res Function(LessonDraft) _then) = _$LessonDraftCopyWithImpl;
@useResult
$Res call({
 int enrollmentId, DateTime startsAt, Duration duration, Money price, String? topic, String? note
});




}
/// @nodoc
class _$LessonDraftCopyWithImpl<$Res>
    implements $LessonDraftCopyWith<$Res> {
  _$LessonDraftCopyWithImpl(this._self, this._then);

  final LessonDraft _self;
  final $Res Function(LessonDraft) _then;

/// Create a copy of LessonDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enrollmentId = null,Object? startsAt = null,Object? duration = null,Object? price = null,Object? topic = freezed,Object? note = freezed,}) {
  return _then(LessonDraft(
enrollmentId: null == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as int,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LessonDraft].
extension LessonDraftPatterns on LessonDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LessonDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LessonDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LessonDraft value)  $default,){
final _that = this;
switch (_that) {
case _LessonDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LessonDraft value)?  $default,){
final _that = this;
switch (_that) {
case _LessonDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int enrollmentId,  DateTime startsAt,  Duration duration,  Money price,  String? topic,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonDraft() when $default != null:
return $default(_that.enrollmentId,_that.startsAt,_that.duration,_that.price,_that.topic,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int enrollmentId,  DateTime startsAt,  Duration duration,  Money price,  String? topic,  String? note)  $default,) {final _that = this;
switch (_that) {
case _LessonDraft():
return $default(_that.enrollmentId,_that.startsAt,_that.duration,_that.price,_that.topic,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int enrollmentId,  DateTime startsAt,  Duration duration,  Money price,  String? topic,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _LessonDraft() when $default != null:
return $default(_that.enrollmentId,_that.startsAt,_that.duration,_that.price,_that.topic,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _LessonDraft implements LessonDraft {
  const _LessonDraft({required this.enrollmentId, required this.startsAt, required this.duration, required this.price, this.topic, this.note});
  

@override final  int enrollmentId;
@override final  DateTime startsAt;
@override final  Duration duration;
@override final  Money price;
@override final  String? topic;
@override final  String? note;

/// Create a copy of LessonDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonDraftCopyWith<_LessonDraft> get copyWith => __$LessonDraftCopyWithImpl<_LessonDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonDraft&&(identical(other.enrollmentId, enrollmentId) || other.enrollmentId == enrollmentId)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.price, price) || other.price == price)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,enrollmentId,startsAt,duration,price,topic,note);
}

@override
String toString() {
    return 'LessonDraft(enrollmentId: $enrollmentId, startsAt: $startsAt, duration: $duration, price: $price, topic: $topic, note: $note)';
}


}

/// @nodoc
abstract mixin class _$LessonDraftCopyWith<$Res> implements $LessonDraftCopyWith<$Res> {
  factory _$LessonDraftCopyWith(_LessonDraft value, $Res Function(_LessonDraft) _then) = __$LessonDraftCopyWithImpl;
@override @useResult
$Res call({
 int enrollmentId, DateTime startsAt, Duration duration, Money price, String? topic, String? note
});




}
/// @nodoc
class __$LessonDraftCopyWithImpl<$Res>
    implements _$LessonDraftCopyWith<$Res> {
  __$LessonDraftCopyWithImpl(this._self, this._then);

  final _LessonDraft _self;
  final $Res Function(_LessonDraft) _then;

/// Create a copy of LessonDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enrollmentId = null,Object? startsAt = null,Object? duration = null,Object? price = null,Object? topic = freezed,Object? note = freezed,}) {
  return _then(_LessonDraft(
enrollmentId: null == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as int,startsAt: null == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

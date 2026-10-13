// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enrollment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Enrollment {

 int get id; int get studentId; int get subjectId;@MoneyConverter() Money get rate; Duration get defaultDuration;/// Общая заметка по направлению: цели, слабые места.
 String? get note; bool get isArchived;
/// Create a copy of Enrollment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnrollmentCopyWith<Enrollment> get copyWith => _$EnrollmentCopyWithImpl<Enrollment>(this as Enrollment, _$identity);

  /// Serializes this Enrollment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Enrollment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Enrollment&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.studentId, _this.studentId) || other.studentId == _this.studentId)&&(identical(other.subjectId, _this.subjectId) || other.subjectId == _this.subjectId)&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.defaultDuration, _this.defaultDuration) || other.defaultDuration == _this.defaultDuration)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.isArchived, _this.isArchived) || other.isArchived == _this.isArchived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Enrollment;
  return Object.hash(runtimeType,_this.id,_this.studentId,_this.subjectId,_this.rate,_this.defaultDuration,_this.note,_this.isArchived);
}

@override
String toString() {
  final _this = this as Enrollment;
  return 'Enrollment(id: ${_this.id}, studentId: ${_this.studentId}, subjectId: ${_this.subjectId}, rate: ${_this.rate}, defaultDuration: ${_this.defaultDuration}, note: ${_this.note}, isArchived: ${_this.isArchived})';
}


}

/// @nodoc
abstract mixin class $EnrollmentCopyWith<$Res>  {
  factory $EnrollmentCopyWith(Enrollment value, $Res Function(Enrollment) _then) = _$EnrollmentCopyWithImpl;
@useResult
$Res call({
 int id, int studentId, int subjectId,@MoneyConverter() Money rate, Duration defaultDuration, String? note, bool isArchived
});




}
/// @nodoc
class _$EnrollmentCopyWithImpl<$Res>
    implements $EnrollmentCopyWith<$Res> {
  _$EnrollmentCopyWithImpl(this._self, this._then);

  final Enrollment _self;
  final $Res Function(Enrollment) _then;

/// Create a copy of Enrollment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? studentId = null,Object? subjectId = null,Object? rate = null,Object? defaultDuration = null,Object? note = freezed,Object? isArchived = null,}) {
  return _then(Enrollment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as int,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Money,defaultDuration: null == defaultDuration ? _self.defaultDuration : defaultDuration // ignore: cast_nullable_to_non_nullable
as Duration,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Enrollment].
extension EnrollmentPatterns on Enrollment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Enrollment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Enrollment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Enrollment value)  $default,){
final _that = this;
switch (_that) {
case _Enrollment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Enrollment value)?  $default,){
final _that = this;
switch (_that) {
case _Enrollment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int studentId,  int subjectId, @MoneyConverter()  Money rate,  Duration defaultDuration,  String? note,  bool isArchived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Enrollment() when $default != null:
return $default(_that.id,_that.studentId,_that.subjectId,_that.rate,_that.defaultDuration,_that.note,_that.isArchived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int studentId,  int subjectId, @MoneyConverter()  Money rate,  Duration defaultDuration,  String? note,  bool isArchived)  $default,) {final _that = this;
switch (_that) {
case _Enrollment():
return $default(_that.id,_that.studentId,_that.subjectId,_that.rate,_that.defaultDuration,_that.note,_that.isArchived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int studentId,  int subjectId, @MoneyConverter()  Money rate,  Duration defaultDuration,  String? note,  bool isArchived)?  $default,) {final _that = this;
switch (_that) {
case _Enrollment() when $default != null:
return $default(_that.id,_that.studentId,_that.subjectId,_that.rate,_that.defaultDuration,_that.note,_that.isArchived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Enrollment implements Enrollment {
  const _Enrollment({required this.id, required this.studentId, required this.subjectId, @MoneyConverter() required this.rate, required this.defaultDuration, this.note, this.isArchived = false});
  factory _Enrollment.fromJson(Map<String, dynamic> json) => _$EnrollmentFromJson(json);

@override final  int id;
@override final  int studentId;
@override final  int subjectId;
@override@MoneyConverter() final  Money rate;
@override final  Duration defaultDuration;
/// Общая заметка по направлению: цели, слабые места.
@override final  String? note;
@override@JsonKey() final  bool isArchived;

/// Create a copy of Enrollment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnrollmentCopyWith<_Enrollment> get copyWith => __$EnrollmentCopyWithImpl<_Enrollment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EnrollmentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Enrollment&&(identical(other.id, id) || other.id == id)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.defaultDuration, defaultDuration) || other.defaultDuration == defaultDuration)&&(identical(other.note, note) || other.note == note)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,studentId,subjectId,rate,defaultDuration,note,isArchived);
}

@override
String toString() {
    return 'Enrollment(id: $id, studentId: $studentId, subjectId: $subjectId, rate: $rate, defaultDuration: $defaultDuration, note: $note, isArchived: $isArchived)';
}


}

/// @nodoc
abstract mixin class _$EnrollmentCopyWith<$Res> implements $EnrollmentCopyWith<$Res> {
  factory _$EnrollmentCopyWith(_Enrollment value, $Res Function(_Enrollment) _then) = __$EnrollmentCopyWithImpl;
@override @useResult
$Res call({
 int id, int studentId, int subjectId,@MoneyConverter() Money rate, Duration defaultDuration, String? note, bool isArchived
});




}
/// @nodoc
class __$EnrollmentCopyWithImpl<$Res>
    implements _$EnrollmentCopyWith<$Res> {
  __$EnrollmentCopyWithImpl(this._self, this._then);

  final _Enrollment _self;
  final $Res Function(_Enrollment) _then;

/// Create a copy of Enrollment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? studentId = null,Object? subjectId = null,Object? rate = null,Object? defaultDuration = null,Object? note = freezed,Object? isArchived = null,}) {
  return _then(_Enrollment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as int,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Money,defaultDuration: null == defaultDuration ? _self.defaultDuration : defaultDuration // ignore: cast_nullable_to_non_nullable
as Duration,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$EnrollmentDraft {

 int get studentId; int get subjectId; Money get rate; Duration get defaultDuration; String? get note;
/// Create a copy of EnrollmentDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnrollmentDraftCopyWith<EnrollmentDraft> get copyWith => _$EnrollmentDraftCopyWithImpl<EnrollmentDraft>(this as EnrollmentDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EnrollmentDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnrollmentDraft&&(identical(other.studentId, _this.studentId) || other.studentId == _this.studentId)&&(identical(other.subjectId, _this.subjectId) || other.subjectId == _this.subjectId)&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.defaultDuration, _this.defaultDuration) || other.defaultDuration == _this.defaultDuration)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as EnrollmentDraft;
  return Object.hash(runtimeType,_this.studentId,_this.subjectId,_this.rate,_this.defaultDuration,_this.note);
}

@override
String toString() {
  final _this = this as EnrollmentDraft;
  return 'EnrollmentDraft(studentId: ${_this.studentId}, subjectId: ${_this.subjectId}, rate: ${_this.rate}, defaultDuration: ${_this.defaultDuration}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $EnrollmentDraftCopyWith<$Res>  {
  factory $EnrollmentDraftCopyWith(EnrollmentDraft value, $Res Function(EnrollmentDraft) _then) = _$EnrollmentDraftCopyWithImpl;
@useResult
$Res call({
 int studentId, int subjectId, Money rate, Duration defaultDuration, String? note
});




}
/// @nodoc
class _$EnrollmentDraftCopyWithImpl<$Res>
    implements $EnrollmentDraftCopyWith<$Res> {
  _$EnrollmentDraftCopyWithImpl(this._self, this._then);

  final EnrollmentDraft _self;
  final $Res Function(EnrollmentDraft) _then;

/// Create a copy of EnrollmentDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? studentId = null,Object? subjectId = null,Object? rate = null,Object? defaultDuration = null,Object? note = freezed,}) {
  return _then(EnrollmentDraft(
studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as int,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Money,defaultDuration: null == defaultDuration ? _self.defaultDuration : defaultDuration // ignore: cast_nullable_to_non_nullable
as Duration,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EnrollmentDraft].
extension EnrollmentDraftPatterns on EnrollmentDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EnrollmentDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EnrollmentDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EnrollmentDraft value)  $default,){
final _that = this;
switch (_that) {
case _EnrollmentDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EnrollmentDraft value)?  $default,){
final _that = this;
switch (_that) {
case _EnrollmentDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int studentId,  int subjectId,  Money rate,  Duration defaultDuration,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnrollmentDraft() when $default != null:
return $default(_that.studentId,_that.subjectId,_that.rate,_that.defaultDuration,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int studentId,  int subjectId,  Money rate,  Duration defaultDuration,  String? note)  $default,) {final _that = this;
switch (_that) {
case _EnrollmentDraft():
return $default(_that.studentId,_that.subjectId,_that.rate,_that.defaultDuration,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int studentId,  int subjectId,  Money rate,  Duration defaultDuration,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _EnrollmentDraft() when $default != null:
return $default(_that.studentId,_that.subjectId,_that.rate,_that.defaultDuration,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _EnrollmentDraft implements EnrollmentDraft {
  const _EnrollmentDraft({required this.studentId, required this.subjectId, required this.rate, this.defaultDuration = const Duration(minutes: 60), this.note});
  

@override final  int studentId;
@override final  int subjectId;
@override final  Money rate;
@override@JsonKey() final  Duration defaultDuration;
@override final  String? note;

/// Create a copy of EnrollmentDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnrollmentDraftCopyWith<_EnrollmentDraft> get copyWith => __$EnrollmentDraftCopyWithImpl<_EnrollmentDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnrollmentDraft&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.defaultDuration, defaultDuration) || other.defaultDuration == defaultDuration)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,studentId,subjectId,rate,defaultDuration,note);
}

@override
String toString() {
    return 'EnrollmentDraft(studentId: $studentId, subjectId: $subjectId, rate: $rate, defaultDuration: $defaultDuration, note: $note)';
}


}

/// @nodoc
abstract mixin class _$EnrollmentDraftCopyWith<$Res> implements $EnrollmentDraftCopyWith<$Res> {
  factory _$EnrollmentDraftCopyWith(_EnrollmentDraft value, $Res Function(_EnrollmentDraft) _then) = __$EnrollmentDraftCopyWithImpl;
@override @useResult
$Res call({
 int studentId, int subjectId, Money rate, Duration defaultDuration, String? note
});




}
/// @nodoc
class __$EnrollmentDraftCopyWithImpl<$Res>
    implements _$EnrollmentDraftCopyWith<$Res> {
  __$EnrollmentDraftCopyWithImpl(this._self, this._then);

  final _EnrollmentDraft _self;
  final $Res Function(_EnrollmentDraft) _then;

/// Create a copy of EnrollmentDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? studentId = null,Object? subjectId = null,Object? rate = null,Object? defaultDuration = null,Object? note = freezed,}) {
  return _then(_EnrollmentDraft(
studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as int,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as Money,defaultDuration: null == defaultDuration ? _self.defaultDuration : defaultDuration // ignore: cast_nullable_to_non_nullable
as Duration,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

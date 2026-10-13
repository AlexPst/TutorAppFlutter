// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgressEntry {

 int get id; int get enrollmentId; int? get lessonId; DateTime get date; String? get topic; int? get grade; String? get note;
/// Create a copy of ProgressEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressEntryCopyWith<ProgressEntry> get copyWith => _$ProgressEntryCopyWithImpl<ProgressEntry>(this as ProgressEntry, _$identity);

  /// Serializes this ProgressEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProgressEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.enrollmentId, _this.enrollmentId) || other.enrollmentId == _this.enrollmentId)&&(identical(other.lessonId, _this.lessonId) || other.lessonId == _this.lessonId)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.topic, _this.topic) || other.topic == _this.topic)&&(identical(other.grade, _this.grade) || other.grade == _this.grade)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProgressEntry;
  return Object.hash(runtimeType,_this.id,_this.enrollmentId,_this.lessonId,_this.date,_this.topic,_this.grade,_this.note);
}

@override
String toString() {
  final _this = this as ProgressEntry;
  return 'ProgressEntry(id: ${_this.id}, enrollmentId: ${_this.enrollmentId}, lessonId: ${_this.lessonId}, date: ${_this.date}, topic: ${_this.topic}, grade: ${_this.grade}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $ProgressEntryCopyWith<$Res>  {
  factory $ProgressEntryCopyWith(ProgressEntry value, $Res Function(ProgressEntry) _then) = _$ProgressEntryCopyWithImpl;
@useResult
$Res call({
 int id, int enrollmentId, int? lessonId, DateTime date, String? topic, int? grade, String? note
});




}
/// @nodoc
class _$ProgressEntryCopyWithImpl<$Res>
    implements $ProgressEntryCopyWith<$Res> {
  _$ProgressEntryCopyWithImpl(this._self, this._then);

  final ProgressEntry _self;
  final $Res Function(ProgressEntry) _then;

/// Create a copy of ProgressEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? enrollmentId = null,Object? lessonId = freezed,Object? date = null,Object? topic = freezed,Object? grade = freezed,Object? note = freezed,}) {
  return _then(ProgressEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,enrollmentId: null == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as int,lessonId: freezed == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgressEntry].
extension ProgressEntryPatterns on ProgressEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressEntry value)  $default,){
final _that = this;
switch (_that) {
case _ProgressEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int enrollmentId,  int? lessonId,  DateTime date,  String? topic,  int? grade,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressEntry() when $default != null:
return $default(_that.id,_that.enrollmentId,_that.lessonId,_that.date,_that.topic,_that.grade,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int enrollmentId,  int? lessonId,  DateTime date,  String? topic,  int? grade,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ProgressEntry():
return $default(_that.id,_that.enrollmentId,_that.lessonId,_that.date,_that.topic,_that.grade,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int enrollmentId,  int? lessonId,  DateTime date,  String? topic,  int? grade,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ProgressEntry() when $default != null:
return $default(_that.id,_that.enrollmentId,_that.lessonId,_that.date,_that.topic,_that.grade,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgressEntry extends ProgressEntry {
  const _ProgressEntry({required this.id, required this.enrollmentId, this.lessonId, required this.date, this.topic, this.grade, this.note}): super._();
  factory _ProgressEntry.fromJson(Map<String, dynamic> json) => _$ProgressEntryFromJson(json);

@override final  int id;
@override final  int enrollmentId;
@override final  int? lessonId;
@override final  DateTime date;
@override final  String? topic;
@override final  int? grade;
@override final  String? note;

/// Create a copy of ProgressEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressEntryCopyWith<_ProgressEntry> get copyWith => __$ProgressEntryCopyWithImpl<_ProgressEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgressEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.enrollmentId, enrollmentId) || other.enrollmentId == enrollmentId)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.date, date) || other.date == date)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,enrollmentId,lessonId,date,topic,grade,note);
}

@override
String toString() {
    return 'ProgressEntry(id: $id, enrollmentId: $enrollmentId, lessonId: $lessonId, date: $date, topic: $topic, grade: $grade, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ProgressEntryCopyWith<$Res> implements $ProgressEntryCopyWith<$Res> {
  factory _$ProgressEntryCopyWith(_ProgressEntry value, $Res Function(_ProgressEntry) _then) = __$ProgressEntryCopyWithImpl;
@override @useResult
$Res call({
 int id, int enrollmentId, int? lessonId, DateTime date, String? topic, int? grade, String? note
});




}
/// @nodoc
class __$ProgressEntryCopyWithImpl<$Res>
    implements _$ProgressEntryCopyWith<$Res> {
  __$ProgressEntryCopyWithImpl(this._self, this._then);

  final _ProgressEntry _self;
  final $Res Function(_ProgressEntry) _then;

/// Create a copy of ProgressEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? enrollmentId = null,Object? lessonId = freezed,Object? date = null,Object? topic = freezed,Object? grade = freezed,Object? note = freezed,}) {
  return _then(_ProgressEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,enrollmentId: null == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as int,lessonId: freezed == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ProgressEntryDraft {

 int get enrollmentId; int? get lessonId; DateTime get date; String? get topic; int? get grade; String? get note;
/// Create a copy of ProgressEntryDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressEntryDraftCopyWith<ProgressEntryDraft> get copyWith => _$ProgressEntryDraftCopyWithImpl<ProgressEntryDraft>(this as ProgressEntryDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProgressEntryDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressEntryDraft&&(identical(other.enrollmentId, _this.enrollmentId) || other.enrollmentId == _this.enrollmentId)&&(identical(other.lessonId, _this.lessonId) || other.lessonId == _this.lessonId)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.topic, _this.topic) || other.topic == _this.topic)&&(identical(other.grade, _this.grade) || other.grade == _this.grade)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as ProgressEntryDraft;
  return Object.hash(runtimeType,_this.enrollmentId,_this.lessonId,_this.date,_this.topic,_this.grade,_this.note);
}

@override
String toString() {
  final _this = this as ProgressEntryDraft;
  return 'ProgressEntryDraft(enrollmentId: ${_this.enrollmentId}, lessonId: ${_this.lessonId}, date: ${_this.date}, topic: ${_this.topic}, grade: ${_this.grade}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $ProgressEntryDraftCopyWith<$Res>  {
  factory $ProgressEntryDraftCopyWith(ProgressEntryDraft value, $Res Function(ProgressEntryDraft) _then) = _$ProgressEntryDraftCopyWithImpl;
@useResult
$Res call({
 int enrollmentId, int? lessonId, DateTime date, String? topic, int? grade, String? note
});




}
/// @nodoc
class _$ProgressEntryDraftCopyWithImpl<$Res>
    implements $ProgressEntryDraftCopyWith<$Res> {
  _$ProgressEntryDraftCopyWithImpl(this._self, this._then);

  final ProgressEntryDraft _self;
  final $Res Function(ProgressEntryDraft) _then;

/// Create a copy of ProgressEntryDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enrollmentId = null,Object? lessonId = freezed,Object? date = null,Object? topic = freezed,Object? grade = freezed,Object? note = freezed,}) {
  return _then(ProgressEntryDraft(
enrollmentId: null == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as int,lessonId: freezed == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgressEntryDraft].
extension ProgressEntryDraftPatterns on ProgressEntryDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressEntryDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressEntryDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressEntryDraft value)  $default,){
final _that = this;
switch (_that) {
case _ProgressEntryDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressEntryDraft value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressEntryDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int enrollmentId,  int? lessonId,  DateTime date,  String? topic,  int? grade,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressEntryDraft() when $default != null:
return $default(_that.enrollmentId,_that.lessonId,_that.date,_that.topic,_that.grade,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int enrollmentId,  int? lessonId,  DateTime date,  String? topic,  int? grade,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ProgressEntryDraft():
return $default(_that.enrollmentId,_that.lessonId,_that.date,_that.topic,_that.grade,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int enrollmentId,  int? lessonId,  DateTime date,  String? topic,  int? grade,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ProgressEntryDraft() when $default != null:
return $default(_that.enrollmentId,_that.lessonId,_that.date,_that.topic,_that.grade,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _ProgressEntryDraft implements ProgressEntryDraft {
  const _ProgressEntryDraft({required this.enrollmentId, this.lessonId, required this.date, this.topic, this.grade, this.note});
  

@override final  int enrollmentId;
@override final  int? lessonId;
@override final  DateTime date;
@override final  String? topic;
@override final  int? grade;
@override final  String? note;

/// Create a copy of ProgressEntryDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressEntryDraftCopyWith<_ProgressEntryDraft> get copyWith => __$ProgressEntryDraftCopyWithImpl<_ProgressEntryDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressEntryDraft&&(identical(other.enrollmentId, enrollmentId) || other.enrollmentId == enrollmentId)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.date, date) || other.date == date)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,enrollmentId,lessonId,date,topic,grade,note);
}

@override
String toString() {
    return 'ProgressEntryDraft(enrollmentId: $enrollmentId, lessonId: $lessonId, date: $date, topic: $topic, grade: $grade, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ProgressEntryDraftCopyWith<$Res> implements $ProgressEntryDraftCopyWith<$Res> {
  factory _$ProgressEntryDraftCopyWith(_ProgressEntryDraft value, $Res Function(_ProgressEntryDraft) _then) = __$ProgressEntryDraftCopyWithImpl;
@override @useResult
$Res call({
 int enrollmentId, int? lessonId, DateTime date, String? topic, int? grade, String? note
});




}
/// @nodoc
class __$ProgressEntryDraftCopyWithImpl<$Res>
    implements _$ProgressEntryDraftCopyWith<$Res> {
  __$ProgressEntryDraftCopyWithImpl(this._self, this._then);

  final _ProgressEntryDraft _self;
  final $Res Function(_ProgressEntryDraft) _then;

/// Create a copy of ProgressEntryDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enrollmentId = null,Object? lessonId = freezed,Object? date = null,Object? topic = freezed,Object? grade = freezed,Object? note = freezed,}) {
  return _then(_ProgressEntryDraft(
enrollmentId: null == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as int,lessonId: freezed == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

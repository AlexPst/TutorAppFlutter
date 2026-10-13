// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgressItem {

 DateTime get date; int? get lessonId; int? get entryId; String? get topic; int? get grade; String? get note;
/// Create a copy of ProgressItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressItemCopyWith<ProgressItem> get copyWith => _$ProgressItemCopyWithImpl<ProgressItem>(this as ProgressItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProgressItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressItem&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.lessonId, _this.lessonId) || other.lessonId == _this.lessonId)&&(identical(other.entryId, _this.entryId) || other.entryId == _this.entryId)&&(identical(other.topic, _this.topic) || other.topic == _this.topic)&&(identical(other.grade, _this.grade) || other.grade == _this.grade)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as ProgressItem;
  return Object.hash(runtimeType,_this.date,_this.lessonId,_this.entryId,_this.topic,_this.grade,_this.note);
}

@override
String toString() {
  final _this = this as ProgressItem;
  return 'ProgressItem(date: ${_this.date}, lessonId: ${_this.lessonId}, entryId: ${_this.entryId}, topic: ${_this.topic}, grade: ${_this.grade}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $ProgressItemCopyWith<$Res>  {
  factory $ProgressItemCopyWith(ProgressItem value, $Res Function(ProgressItem) _then) = _$ProgressItemCopyWithImpl;
@useResult
$Res call({
 DateTime date, int? lessonId, int? entryId, String? topic, int? grade, String? note
});




}
/// @nodoc
class _$ProgressItemCopyWithImpl<$Res>
    implements $ProgressItemCopyWith<$Res> {
  _$ProgressItemCopyWithImpl(this._self, this._then);

  final ProgressItem _self;
  final $Res Function(ProgressItem) _then;

/// Create a copy of ProgressItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? lessonId = freezed,Object? entryId = freezed,Object? topic = freezed,Object? grade = freezed,Object? note = freezed,}) {
  return _then(ProgressItem(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,lessonId: freezed == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int?,entryId: freezed == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as int?,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgressItem].
extension ProgressItemPatterns on ProgressItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressItem value)  $default,){
final _that = this;
switch (_that) {
case _ProgressItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressItem value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  int? lessonId,  int? entryId,  String? topic,  int? grade,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressItem() when $default != null:
return $default(_that.date,_that.lessonId,_that.entryId,_that.topic,_that.grade,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  int? lessonId,  int? entryId,  String? topic,  int? grade,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ProgressItem():
return $default(_that.date,_that.lessonId,_that.entryId,_that.topic,_that.grade,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  int? lessonId,  int? entryId,  String? topic,  int? grade,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ProgressItem() when $default != null:
return $default(_that.date,_that.lessonId,_that.entryId,_that.topic,_that.grade,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _ProgressItem implements ProgressItem {
  const _ProgressItem({required this.date, this.lessonId, this.entryId, this.topic, this.grade, this.note});
  

@override final  DateTime date;
@override final  int? lessonId;
@override final  int? entryId;
@override final  String? topic;
@override final  int? grade;
@override final  String? note;

/// Create a copy of ProgressItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressItemCopyWith<_ProgressItem> get copyWith => __$ProgressItemCopyWithImpl<_ProgressItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressItem&&(identical(other.date, date) || other.date == date)&&(identical(other.lessonId, lessonId) || other.lessonId == lessonId)&&(identical(other.entryId, entryId) || other.entryId == entryId)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date,lessonId,entryId,topic,grade,note);
}

@override
String toString() {
    return 'ProgressItem(date: $date, lessonId: $lessonId, entryId: $entryId, topic: $topic, grade: $grade, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ProgressItemCopyWith<$Res> implements $ProgressItemCopyWith<$Res> {
  factory _$ProgressItemCopyWith(_ProgressItem value, $Res Function(_ProgressItem) _then) = __$ProgressItemCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int? lessonId, int? entryId, String? topic, int? grade, String? note
});




}
/// @nodoc
class __$ProgressItemCopyWithImpl<$Res>
    implements _$ProgressItemCopyWith<$Res> {
  __$ProgressItemCopyWithImpl(this._self, this._then);

  final _ProgressItem _self;
  final $Res Function(_ProgressItem) _then;

/// Create a copy of ProgressItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? lessonId = freezed,Object? entryId = freezed,Object? topic = freezed,Object? grade = freezed,Object? note = freezed,}) {
  return _then(_ProgressItem(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,lessonId: freezed == lessonId ? _self.lessonId : lessonId // ignore: cast_nullable_to_non_nullable
as int?,entryId: freezed == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as int?,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$SubjectProgress {

 int get enrollmentId;/// Сначала новые.
 List<ProgressItem> get items;
/// Create a copy of SubjectProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubjectProgressCopyWith<SubjectProgress> get copyWith => _$SubjectProgressCopyWithImpl<SubjectProgress>(this as SubjectProgress, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SubjectProgress;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubjectProgress&&(identical(other.enrollmentId, _this.enrollmentId) || other.enrollmentId == _this.enrollmentId)&&const DeepCollectionEquality().equals(other.items, _this.items));
}


@override
int get hashCode {
  final _this = this as SubjectProgress;
  return Object.hash(runtimeType,_this.enrollmentId,const DeepCollectionEquality().hash(_this.items));
}

@override
String toString() {
  final _this = this as SubjectProgress;
  return 'SubjectProgress(enrollmentId: ${_this.enrollmentId}, items: ${_this.items})';
}


}

/// @nodoc
abstract mixin class $SubjectProgressCopyWith<$Res>  {
  factory $SubjectProgressCopyWith(SubjectProgress value, $Res Function(SubjectProgress) _then) = _$SubjectProgressCopyWithImpl;
@useResult
$Res call({
 int enrollmentId, List<ProgressItem> items
});




}
/// @nodoc
class _$SubjectProgressCopyWithImpl<$Res>
    implements $SubjectProgressCopyWith<$Res> {
  _$SubjectProgressCopyWithImpl(this._self, this._then);

  final SubjectProgress _self;
  final $Res Function(SubjectProgress) _then;

/// Create a copy of SubjectProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enrollmentId = null,Object? items = null,}) {
  return _then(SubjectProgress(
enrollmentId: null == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProgressItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [SubjectProgress].
extension SubjectProgressPatterns on SubjectProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubjectProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubjectProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubjectProgress value)  $default,){
final _that = this;
switch (_that) {
case _SubjectProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubjectProgress value)?  $default,){
final _that = this;
switch (_that) {
case _SubjectProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int enrollmentId,  List<ProgressItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubjectProgress() when $default != null:
return $default(_that.enrollmentId,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int enrollmentId,  List<ProgressItem> items)  $default,) {final _that = this;
switch (_that) {
case _SubjectProgress():
return $default(_that.enrollmentId,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int enrollmentId,  List<ProgressItem> items)?  $default,) {final _that = this;
switch (_that) {
case _SubjectProgress() when $default != null:
return $default(_that.enrollmentId,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _SubjectProgress extends SubjectProgress {
  const _SubjectProgress({required this.enrollmentId, required  List<ProgressItem> items}): _items = items,super._();
  

@override final  int enrollmentId;
/// Сначала новые.
 final  List<ProgressItem> _items;
/// Сначала новые.
@override List<ProgressItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of SubjectProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubjectProgressCopyWith<_SubjectProgress> get copyWith => __$SubjectProgressCopyWithImpl<_SubjectProgress>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubjectProgress&&(identical(other.enrollmentId, enrollmentId) || other.enrollmentId == enrollmentId)&&const DeepCollectionEquality().equals(other.items, _items));
}


@override
int get hashCode {
    return Object.hash(runtimeType,enrollmentId,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'SubjectProgress(enrollmentId: $enrollmentId, items: $items)';
}


}

/// @nodoc
abstract mixin class _$SubjectProgressCopyWith<$Res> implements $SubjectProgressCopyWith<$Res> {
  factory _$SubjectProgressCopyWith(_SubjectProgress value, $Res Function(_SubjectProgress) _then) = __$SubjectProgressCopyWithImpl;
@override @useResult
$Res call({
 int enrollmentId, List<ProgressItem> items
});




}
/// @nodoc
class __$SubjectProgressCopyWithImpl<$Res>
    implements _$SubjectProgressCopyWith<$Res> {
  __$SubjectProgressCopyWithImpl(this._self, this._then);

  final _SubjectProgress _self;
  final $Res Function(_SubjectProgress) _then;

/// Create a copy of SubjectProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enrollmentId = null,Object? items = null,}) {
  return _then(_SubjectProgress(
enrollmentId: null == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProgressItem>,
  ));
}


}

// dart format on

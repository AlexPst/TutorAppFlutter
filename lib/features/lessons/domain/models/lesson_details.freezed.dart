// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LessonDetails {

 Lesson get lesson; int get studentId; String get studentName; int get subjectId; String get subjectName; GradeScale get gradeScale;
/// Create a copy of LessonDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonDetailsCopyWith<LessonDetails> get copyWith => _$LessonDetailsCopyWithImpl<LessonDetails>(this as LessonDetails, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LessonDetails;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonDetails&&(identical(other.lesson, _this.lesson) || other.lesson == _this.lesson)&&(identical(other.studentId, _this.studentId) || other.studentId == _this.studentId)&&(identical(other.studentName, _this.studentName) || other.studentName == _this.studentName)&&(identical(other.subjectId, _this.subjectId) || other.subjectId == _this.subjectId)&&(identical(other.subjectName, _this.subjectName) || other.subjectName == _this.subjectName)&&(identical(other.gradeScale, _this.gradeScale) || other.gradeScale == _this.gradeScale));
}


@override
int get hashCode {
  final _this = this as LessonDetails;
  return Object.hash(runtimeType,_this.lesson,_this.studentId,_this.studentName,_this.subjectId,_this.subjectName,_this.gradeScale);
}

@override
String toString() {
  final _this = this as LessonDetails;
  return 'LessonDetails(lesson: ${_this.lesson}, studentId: ${_this.studentId}, studentName: ${_this.studentName}, subjectId: ${_this.subjectId}, subjectName: ${_this.subjectName}, gradeScale: ${_this.gradeScale})';
}


}

/// @nodoc
abstract mixin class $LessonDetailsCopyWith<$Res>  {
  factory $LessonDetailsCopyWith(LessonDetails value, $Res Function(LessonDetails) _then) = _$LessonDetailsCopyWithImpl;
@useResult
$Res call({
 Lesson lesson, int studentId, String studentName, int subjectId, String subjectName, GradeScale gradeScale
});


$LessonCopyWith<$Res> get lesson;$GradeScaleCopyWith<$Res> get gradeScale;

}
/// @nodoc
class _$LessonDetailsCopyWithImpl<$Res>
    implements $LessonDetailsCopyWith<$Res> {
  _$LessonDetailsCopyWithImpl(this._self, this._then);

  final LessonDetails _self;
  final $Res Function(LessonDetails) _then;

/// Create a copy of LessonDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lesson = null,Object? studentId = null,Object? studentName = null,Object? subjectId = null,Object? subjectName = null,Object? gradeScale = null,}) {
  return _then(LessonDetails(
lesson: null == lesson ? _self.lesson : lesson // ignore: cast_nullable_to_non_nullable
as Lesson,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,studentName: null == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as int,subjectName: null == subjectName ? _self.subjectName : subjectName // ignore: cast_nullable_to_non_nullable
as String,gradeScale: null == gradeScale ? _self.gradeScale : gradeScale // ignore: cast_nullable_to_non_nullable
as GradeScale,
  ));
}
/// Create a copy of LessonDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LessonCopyWith<$Res> get lesson {
  
  return $LessonCopyWith<$Res>(_self.lesson, (value) {
    return _then(_self.copyWith(lesson: value));
  });
}/// Create a copy of LessonDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradeScaleCopyWith<$Res> get gradeScale {
  
  return $GradeScaleCopyWith<$Res>(_self.gradeScale, (value) {
    return _then(_self.copyWith(gradeScale: value));
  });
}
}


/// Adds pattern-matching-related methods to [LessonDetails].
extension LessonDetailsPatterns on LessonDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LessonDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LessonDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LessonDetails value)  $default,){
final _that = this;
switch (_that) {
case _LessonDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LessonDetails value)?  $default,){
final _that = this;
switch (_that) {
case _LessonDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Lesson lesson,  int studentId,  String studentName,  int subjectId,  String subjectName,  GradeScale gradeScale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonDetails() when $default != null:
return $default(_that.lesson,_that.studentId,_that.studentName,_that.subjectId,_that.subjectName,_that.gradeScale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Lesson lesson,  int studentId,  String studentName,  int subjectId,  String subjectName,  GradeScale gradeScale)  $default,) {final _that = this;
switch (_that) {
case _LessonDetails():
return $default(_that.lesson,_that.studentId,_that.studentName,_that.subjectId,_that.subjectName,_that.gradeScale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Lesson lesson,  int studentId,  String studentName,  int subjectId,  String subjectName,  GradeScale gradeScale)?  $default,) {final _that = this;
switch (_that) {
case _LessonDetails() when $default != null:
return $default(_that.lesson,_that.studentId,_that.studentName,_that.subjectId,_that.subjectName,_that.gradeScale);case _:
  return null;

}
}

}

/// @nodoc


class _LessonDetails implements LessonDetails {
  const _LessonDetails({required this.lesson, required this.studentId, required this.studentName, required this.subjectId, required this.subjectName, required this.gradeScale});
  

@override final  Lesson lesson;
@override final  int studentId;
@override final  String studentName;
@override final  int subjectId;
@override final  String subjectName;
@override final  GradeScale gradeScale;

/// Create a copy of LessonDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonDetailsCopyWith<_LessonDetails> get copyWith => __$LessonDetailsCopyWithImpl<_LessonDetails>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonDetails&&(identical(other.lesson, lesson) || other.lesson == lesson)&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.studentName, studentName) || other.studentName == studentName)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.subjectName, subjectName) || other.subjectName == subjectName)&&(identical(other.gradeScale, gradeScale) || other.gradeScale == gradeScale));
}


@override
int get hashCode {
    return Object.hash(runtimeType,lesson,studentId,studentName,subjectId,subjectName,gradeScale);
}

@override
String toString() {
    return 'LessonDetails(lesson: $lesson, studentId: $studentId, studentName: $studentName, subjectId: $subjectId, subjectName: $subjectName, gradeScale: $gradeScale)';
}


}

/// @nodoc
abstract mixin class _$LessonDetailsCopyWith<$Res> implements $LessonDetailsCopyWith<$Res> {
  factory _$LessonDetailsCopyWith(_LessonDetails value, $Res Function(_LessonDetails) _then) = __$LessonDetailsCopyWithImpl;
@override @useResult
$Res call({
 Lesson lesson, int studentId, String studentName, int subjectId, String subjectName, GradeScale gradeScale
});


@override $LessonCopyWith<$Res> get lesson;@override $GradeScaleCopyWith<$Res> get gradeScale;

}
/// @nodoc
class __$LessonDetailsCopyWithImpl<$Res>
    implements _$LessonDetailsCopyWith<$Res> {
  __$LessonDetailsCopyWithImpl(this._self, this._then);

  final _LessonDetails _self;
  final $Res Function(_LessonDetails) _then;

/// Create a copy of LessonDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lesson = null,Object? studentId = null,Object? studentName = null,Object? subjectId = null,Object? subjectName = null,Object? gradeScale = null,}) {
  return _then(_LessonDetails(
lesson: null == lesson ? _self.lesson : lesson // ignore: cast_nullable_to_non_nullable
as Lesson,studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,studentName: null == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String,subjectId: null == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as int,subjectName: null == subjectName ? _self.subjectName : subjectName // ignore: cast_nullable_to_non_nullable
as String,gradeScale: null == gradeScale ? _self.gradeScale : gradeScale // ignore: cast_nullable_to_non_nullable
as GradeScale,
  ));
}

/// Create a copy of LessonDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LessonCopyWith<$Res> get lesson {
  
  return $LessonCopyWith<$Res>(_self.lesson, (value) {
    return _then(_self.copyWith(lesson: value));
  });
}/// Create a copy of LessonDetails
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradeScaleCopyWith<$Res> get gradeScale {
  
  return $GradeScaleCopyWith<$Res>(_self.gradeScale, (value) {
    return _then(_self.copyWith(gradeScale: value));
  });
}
}

// dart format on

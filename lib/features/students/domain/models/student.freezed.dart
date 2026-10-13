// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Student {

 int get id; String get fullName; String? get phone; String? get telegram; String? get note; GradeScale get gradeScale; bool get isArchived;
/// Create a copy of Student
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentCopyWith<Student> get copyWith => _$StudentCopyWithImpl<Student>(this as Student, _$identity);

  /// Serializes this Student to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Student;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Student&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.telegram, _this.telegram) || other.telegram == _this.telegram)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.gradeScale, _this.gradeScale) || other.gradeScale == _this.gradeScale)&&(identical(other.isArchived, _this.isArchived) || other.isArchived == _this.isArchived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Student;
  return Object.hash(runtimeType,_this.id,_this.fullName,_this.phone,_this.telegram,_this.note,_this.gradeScale,_this.isArchived);
}

@override
String toString() {
  final _this = this as Student;
  return 'Student(id: ${_this.id}, fullName: ${_this.fullName}, phone: ${_this.phone}, telegram: ${_this.telegram}, note: ${_this.note}, gradeScale: ${_this.gradeScale}, isArchived: ${_this.isArchived})';
}


}

/// @nodoc
abstract mixin class $StudentCopyWith<$Res>  {
  factory $StudentCopyWith(Student value, $Res Function(Student) _then) = _$StudentCopyWithImpl;
@useResult
$Res call({
 int id, String fullName, String? phone, String? telegram, String? note, GradeScale gradeScale, bool isArchived
});


$GradeScaleCopyWith<$Res> get gradeScale;

}
/// @nodoc
class _$StudentCopyWithImpl<$Res>
    implements $StudentCopyWith<$Res> {
  _$StudentCopyWithImpl(this._self, this._then);

  final Student _self;
  final $Res Function(Student) _then;

/// Create a copy of Student
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? phone = freezed,Object? telegram = freezed,Object? note = freezed,Object? gradeScale = null,Object? isArchived = null,}) {
  return _then(Student(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,gradeScale: null == gradeScale ? _self.gradeScale : gradeScale // ignore: cast_nullable_to_non_nullable
as GradeScale,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of Student
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradeScaleCopyWith<$Res> get gradeScale {
  
  return $GradeScaleCopyWith<$Res>(_self.gradeScale, (value) {
    return _then(_self.copyWith(gradeScale: value));
  });
}
}


/// Adds pattern-matching-related methods to [Student].
extension StudentPatterns on Student {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Student value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Student() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Student value)  $default,){
final _that = this;
switch (_that) {
case _Student():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Student value)?  $default,){
final _that = this;
switch (_that) {
case _Student() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String fullName,  String? phone,  String? telegram,  String? note,  GradeScale gradeScale,  bool isArchived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Student() when $default != null:
return $default(_that.id,_that.fullName,_that.phone,_that.telegram,_that.note,_that.gradeScale,_that.isArchived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String fullName,  String? phone,  String? telegram,  String? note,  GradeScale gradeScale,  bool isArchived)  $default,) {final _that = this;
switch (_that) {
case _Student():
return $default(_that.id,_that.fullName,_that.phone,_that.telegram,_that.note,_that.gradeScale,_that.isArchived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String fullName,  String? phone,  String? telegram,  String? note,  GradeScale gradeScale,  bool isArchived)?  $default,) {final _that = this;
switch (_that) {
case _Student() when $default != null:
return $default(_that.id,_that.fullName,_that.phone,_that.telegram,_that.note,_that.gradeScale,_that.isArchived);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Student implements Student {
  const _Student({required this.id, required this.fullName, this.phone, this.telegram, this.note, this.gradeScale = GradeScale.fivePoint, this.isArchived = false});
  factory _Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);

@override final  int id;
@override final  String fullName;
@override final  String? phone;
@override final  String? telegram;
@override final  String? note;
@override@JsonKey() final  GradeScale gradeScale;
@override@JsonKey() final  bool isArchived;

/// Create a copy of Student
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentCopyWith<_Student> get copyWith => __$StudentCopyWithImpl<_Student>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Student&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.telegram, telegram) || other.telegram == telegram)&&(identical(other.note, note) || other.note == note)&&(identical(other.gradeScale, gradeScale) || other.gradeScale == gradeScale)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,fullName,phone,telegram,note,gradeScale,isArchived);
}

@override
String toString() {
    return 'Student(id: $id, fullName: $fullName, phone: $phone, telegram: $telegram, note: $note, gradeScale: $gradeScale, isArchived: $isArchived)';
}


}

/// @nodoc
abstract mixin class _$StudentCopyWith<$Res> implements $StudentCopyWith<$Res> {
  factory _$StudentCopyWith(_Student value, $Res Function(_Student) _then) = __$StudentCopyWithImpl;
@override @useResult
$Res call({
 int id, String fullName, String? phone, String? telegram, String? note, GradeScale gradeScale, bool isArchived
});


@override $GradeScaleCopyWith<$Res> get gradeScale;

}
/// @nodoc
class __$StudentCopyWithImpl<$Res>
    implements _$StudentCopyWith<$Res> {
  __$StudentCopyWithImpl(this._self, this._then);

  final _Student _self;
  final $Res Function(_Student) _then;

/// Create a copy of Student
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? phone = freezed,Object? telegram = freezed,Object? note = freezed,Object? gradeScale = null,Object? isArchived = null,}) {
  return _then(_Student(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,gradeScale: null == gradeScale ? _self.gradeScale : gradeScale // ignore: cast_nullable_to_non_nullable
as GradeScale,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of Student
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradeScaleCopyWith<$Res> get gradeScale {
  
  return $GradeScaleCopyWith<$Res>(_self.gradeScale, (value) {
    return _then(_self.copyWith(gradeScale: value));
  });
}
}

/// @nodoc
mixin _$StudentDraft {

 String get fullName; String? get phone; String? get telegram; String? get note; GradeScale get gradeScale;
/// Create a copy of StudentDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentDraftCopyWith<StudentDraft> get copyWith => _$StudentDraftCopyWithImpl<StudentDraft>(this as StudentDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StudentDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentDraft&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.telegram, _this.telegram) || other.telegram == _this.telegram)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.gradeScale, _this.gradeScale) || other.gradeScale == _this.gradeScale));
}


@override
int get hashCode {
  final _this = this as StudentDraft;
  return Object.hash(runtimeType,_this.fullName,_this.phone,_this.telegram,_this.note,_this.gradeScale);
}

@override
String toString() {
  final _this = this as StudentDraft;
  return 'StudentDraft(fullName: ${_this.fullName}, phone: ${_this.phone}, telegram: ${_this.telegram}, note: ${_this.note}, gradeScale: ${_this.gradeScale})';
}


}

/// @nodoc
abstract mixin class $StudentDraftCopyWith<$Res>  {
  factory $StudentDraftCopyWith(StudentDraft value, $Res Function(StudentDraft) _then) = _$StudentDraftCopyWithImpl;
@useResult
$Res call({
 String fullName, String? phone, String? telegram, String? note, GradeScale gradeScale
});


$GradeScaleCopyWith<$Res> get gradeScale;

}
/// @nodoc
class _$StudentDraftCopyWithImpl<$Res>
    implements $StudentDraftCopyWith<$Res> {
  _$StudentDraftCopyWithImpl(this._self, this._then);

  final StudentDraft _self;
  final $Res Function(StudentDraft) _then;

/// Create a copy of StudentDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? phone = freezed,Object? telegram = freezed,Object? note = freezed,Object? gradeScale = null,}) {
  return _then(StudentDraft(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,gradeScale: null == gradeScale ? _self.gradeScale : gradeScale // ignore: cast_nullable_to_non_nullable
as GradeScale,
  ));
}
/// Create a copy of StudentDraft
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradeScaleCopyWith<$Res> get gradeScale {
  
  return $GradeScaleCopyWith<$Res>(_self.gradeScale, (value) {
    return _then(_self.copyWith(gradeScale: value));
  });
}
}


/// Adds pattern-matching-related methods to [StudentDraft].
extension StudentDraftPatterns on StudentDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentDraft value)  $default,){
final _that = this;
switch (_that) {
case _StudentDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentDraft value)?  $default,){
final _that = this;
switch (_that) {
case _StudentDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullName,  String? phone,  String? telegram,  String? note,  GradeScale gradeScale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentDraft() when $default != null:
return $default(_that.fullName,_that.phone,_that.telegram,_that.note,_that.gradeScale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullName,  String? phone,  String? telegram,  String? note,  GradeScale gradeScale)  $default,) {final _that = this;
switch (_that) {
case _StudentDraft():
return $default(_that.fullName,_that.phone,_that.telegram,_that.note,_that.gradeScale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullName,  String? phone,  String? telegram,  String? note,  GradeScale gradeScale)?  $default,) {final _that = this;
switch (_that) {
case _StudentDraft() when $default != null:
return $default(_that.fullName,_that.phone,_that.telegram,_that.note,_that.gradeScale);case _:
  return null;

}
}

}

/// @nodoc


class _StudentDraft implements StudentDraft {
  const _StudentDraft({required this.fullName, this.phone, this.telegram, this.note, this.gradeScale = GradeScale.fivePoint});
  

@override final  String fullName;
@override final  String? phone;
@override final  String? telegram;
@override final  String? note;
@override@JsonKey() final  GradeScale gradeScale;

/// Create a copy of StudentDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentDraftCopyWith<_StudentDraft> get copyWith => __$StudentDraftCopyWithImpl<_StudentDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentDraft&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.telegram, telegram) || other.telegram == telegram)&&(identical(other.note, note) || other.note == note)&&(identical(other.gradeScale, gradeScale) || other.gradeScale == gradeScale));
}


@override
int get hashCode {
    return Object.hash(runtimeType,fullName,phone,telegram,note,gradeScale);
}

@override
String toString() {
    return 'StudentDraft(fullName: $fullName, phone: $phone, telegram: $telegram, note: $note, gradeScale: $gradeScale)';
}


}

/// @nodoc
abstract mixin class _$StudentDraftCopyWith<$Res> implements $StudentDraftCopyWith<$Res> {
  factory _$StudentDraftCopyWith(_StudentDraft value, $Res Function(_StudentDraft) _then) = __$StudentDraftCopyWithImpl;
@override @useResult
$Res call({
 String fullName, String? phone, String? telegram, String? note, GradeScale gradeScale
});


@override $GradeScaleCopyWith<$Res> get gradeScale;

}
/// @nodoc
class __$StudentDraftCopyWithImpl<$Res>
    implements _$StudentDraftCopyWith<$Res> {
  __$StudentDraftCopyWithImpl(this._self, this._then);

  final _StudentDraft _self;
  final $Res Function(_StudentDraft) _then;

/// Create a copy of StudentDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? phone = freezed,Object? telegram = freezed,Object? note = freezed,Object? gradeScale = null,}) {
  return _then(_StudentDraft(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,telegram: freezed == telegram ? _self.telegram : telegram // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,gradeScale: null == gradeScale ? _self.gradeScale : gradeScale // ignore: cast_nullable_to_non_nullable
as GradeScale,
  ));
}

/// Create a copy of StudentDraft
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

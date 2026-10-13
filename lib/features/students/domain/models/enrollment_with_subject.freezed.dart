// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enrollment_with_subject.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EnrollmentWithSubject {

 Enrollment get enrollment; Subject get subject;
/// Create a copy of EnrollmentWithSubject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnrollmentWithSubjectCopyWith<EnrollmentWithSubject> get copyWith => _$EnrollmentWithSubjectCopyWithImpl<EnrollmentWithSubject>(this as EnrollmentWithSubject, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EnrollmentWithSubject;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnrollmentWithSubject&&(identical(other.enrollment, _this.enrollment) || other.enrollment == _this.enrollment)&&(identical(other.subject, _this.subject) || other.subject == _this.subject));
}


@override
int get hashCode {
  final _this = this as EnrollmentWithSubject;
  return Object.hash(runtimeType,_this.enrollment,_this.subject);
}

@override
String toString() {
  final _this = this as EnrollmentWithSubject;
  return 'EnrollmentWithSubject(enrollment: ${_this.enrollment}, subject: ${_this.subject})';
}


}

/// @nodoc
abstract mixin class $EnrollmentWithSubjectCopyWith<$Res>  {
  factory $EnrollmentWithSubjectCopyWith(EnrollmentWithSubject value, $Res Function(EnrollmentWithSubject) _then) = _$EnrollmentWithSubjectCopyWithImpl;
@useResult
$Res call({
 Enrollment enrollment, Subject subject
});


$EnrollmentCopyWith<$Res> get enrollment;$SubjectCopyWith<$Res> get subject;

}
/// @nodoc
class _$EnrollmentWithSubjectCopyWithImpl<$Res>
    implements $EnrollmentWithSubjectCopyWith<$Res> {
  _$EnrollmentWithSubjectCopyWithImpl(this._self, this._then);

  final EnrollmentWithSubject _self;
  final $Res Function(EnrollmentWithSubject) _then;

/// Create a copy of EnrollmentWithSubject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enrollment = null,Object? subject = null,}) {
  return _then(EnrollmentWithSubject(
enrollment: null == enrollment ? _self.enrollment : enrollment // ignore: cast_nullable_to_non_nullable
as Enrollment,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as Subject,
  ));
}
/// Create a copy of EnrollmentWithSubject
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EnrollmentCopyWith<$Res> get enrollment {
  
  return $EnrollmentCopyWith<$Res>(_self.enrollment, (value) {
    return _then(_self.copyWith(enrollment: value));
  });
}/// Create a copy of EnrollmentWithSubject
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubjectCopyWith<$Res> get subject {
  
  return $SubjectCopyWith<$Res>(_self.subject, (value) {
    return _then(_self.copyWith(subject: value));
  });
}
}


/// Adds pattern-matching-related methods to [EnrollmentWithSubject].
extension EnrollmentWithSubjectPatterns on EnrollmentWithSubject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EnrollmentWithSubject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EnrollmentWithSubject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EnrollmentWithSubject value)  $default,){
final _that = this;
switch (_that) {
case _EnrollmentWithSubject():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EnrollmentWithSubject value)?  $default,){
final _that = this;
switch (_that) {
case _EnrollmentWithSubject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Enrollment enrollment,  Subject subject)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnrollmentWithSubject() when $default != null:
return $default(_that.enrollment,_that.subject);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Enrollment enrollment,  Subject subject)  $default,) {final _that = this;
switch (_that) {
case _EnrollmentWithSubject():
return $default(_that.enrollment,_that.subject);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Enrollment enrollment,  Subject subject)?  $default,) {final _that = this;
switch (_that) {
case _EnrollmentWithSubject() when $default != null:
return $default(_that.enrollment,_that.subject);case _:
  return null;

}
}

}

/// @nodoc


class _EnrollmentWithSubject implements EnrollmentWithSubject {
  const _EnrollmentWithSubject({required this.enrollment, required this.subject});
  

@override final  Enrollment enrollment;
@override final  Subject subject;

/// Create a copy of EnrollmentWithSubject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnrollmentWithSubjectCopyWith<_EnrollmentWithSubject> get copyWith => __$EnrollmentWithSubjectCopyWithImpl<_EnrollmentWithSubject>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnrollmentWithSubject&&(identical(other.enrollment, enrollment) || other.enrollment == enrollment)&&(identical(other.subject, subject) || other.subject == subject));
}


@override
int get hashCode {
    return Object.hash(runtimeType,enrollment,subject);
}

@override
String toString() {
    return 'EnrollmentWithSubject(enrollment: $enrollment, subject: $subject)';
}


}

/// @nodoc
abstract mixin class _$EnrollmentWithSubjectCopyWith<$Res> implements $EnrollmentWithSubjectCopyWith<$Res> {
  factory _$EnrollmentWithSubjectCopyWith(_EnrollmentWithSubject value, $Res Function(_EnrollmentWithSubject) _then) = __$EnrollmentWithSubjectCopyWithImpl;
@override @useResult
$Res call({
 Enrollment enrollment, Subject subject
});


@override $EnrollmentCopyWith<$Res> get enrollment;@override $SubjectCopyWith<$Res> get subject;

}
/// @nodoc
class __$EnrollmentWithSubjectCopyWithImpl<$Res>
    implements _$EnrollmentWithSubjectCopyWith<$Res> {
  __$EnrollmentWithSubjectCopyWithImpl(this._self, this._then);

  final _EnrollmentWithSubject _self;
  final $Res Function(_EnrollmentWithSubject) _then;

/// Create a copy of EnrollmentWithSubject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enrollment = null,Object? subject = null,}) {
  return _then(_EnrollmentWithSubject(
enrollment: null == enrollment ? _self.enrollment : enrollment // ignore: cast_nullable_to_non_nullable
as Enrollment,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as Subject,
  ));
}

/// Create a copy of EnrollmentWithSubject
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EnrollmentCopyWith<$Res> get enrollment {
  
  return $EnrollmentCopyWith<$Res>(_self.enrollment, (value) {
    return _then(_self.copyWith(enrollment: value));
  });
}/// Create a copy of EnrollmentWithSubject
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubjectCopyWith<$Res> get subject {
  
  return $SubjectCopyWith<$Res>(_self.subject, (value) {
    return _then(_self.copyWith(subject: value));
  });
}
}

// dart format on

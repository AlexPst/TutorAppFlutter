// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudentListItem {

 Student get student; List<Subject> get subjects; StudentBalance? get balance;
/// Create a copy of StudentListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentListItemCopyWith<StudentListItem> get copyWith => _$StudentListItemCopyWithImpl<StudentListItem>(this as StudentListItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StudentListItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentListItem&&(identical(other.student, _this.student) || other.student == _this.student)&&const DeepCollectionEquality().equals(other.subjects, _this.subjects)&&(identical(other.balance, _this.balance) || other.balance == _this.balance));
}


@override
int get hashCode {
  final _this = this as StudentListItem;
  return Object.hash(runtimeType,_this.student,const DeepCollectionEquality().hash(_this.subjects),_this.balance);
}

@override
String toString() {
  final _this = this as StudentListItem;
  return 'StudentListItem(student: ${_this.student}, subjects: ${_this.subjects}, balance: ${_this.balance})';
}


}

/// @nodoc
abstract mixin class $StudentListItemCopyWith<$Res>  {
  factory $StudentListItemCopyWith(StudentListItem value, $Res Function(StudentListItem) _then) = _$StudentListItemCopyWithImpl;
@useResult
$Res call({
 Student student, List<Subject> subjects, StudentBalance? balance
});


$StudentCopyWith<$Res> get student;$StudentBalanceCopyWith<$Res>? get balance;

}
/// @nodoc
class _$StudentListItemCopyWithImpl<$Res>
    implements $StudentListItemCopyWith<$Res> {
  _$StudentListItemCopyWithImpl(this._self, this._then);

  final StudentListItem _self;
  final $Res Function(StudentListItem) _then;

/// Create a copy of StudentListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? student = null,Object? subjects = null,Object? balance = freezed,}) {
  return _then(StudentListItem(
student: null == student ? _self.student : student // ignore: cast_nullable_to_non_nullable
as Student,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<Subject>,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as StudentBalance?,
  ));
}
/// Create a copy of StudentListItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentCopyWith<$Res> get student {
  
  return $StudentCopyWith<$Res>(_self.student, (value) {
    return _then(_self.copyWith(student: value));
  });
}/// Create a copy of StudentListItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentBalanceCopyWith<$Res>? get balance {
    if (_self.balance == null) {
    return null;
  }

  return $StudentBalanceCopyWith<$Res>(_self.balance!, (value) {
    return _then(_self.copyWith(balance: value));
  });
}
}


/// Adds pattern-matching-related methods to [StudentListItem].
extension StudentListItemPatterns on StudentListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentListItem value)  $default,){
final _that = this;
switch (_that) {
case _StudentListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentListItem value)?  $default,){
final _that = this;
switch (_that) {
case _StudentListItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Student student,  List<Subject> subjects,  StudentBalance? balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentListItem() when $default != null:
return $default(_that.student,_that.subjects,_that.balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Student student,  List<Subject> subjects,  StudentBalance? balance)  $default,) {final _that = this;
switch (_that) {
case _StudentListItem():
return $default(_that.student,_that.subjects,_that.balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Student student,  List<Subject> subjects,  StudentBalance? balance)?  $default,) {final _that = this;
switch (_that) {
case _StudentListItem() when $default != null:
return $default(_that.student,_that.subjects,_that.balance);case _:
  return null;

}
}

}

/// @nodoc


class _StudentListItem extends StudentListItem {
  const _StudentListItem({required this.student, required  List<Subject> subjects, this.balance}): _subjects = subjects,super._();
  

@override final  Student student;
 final  List<Subject> _subjects;
@override List<Subject> get subjects {
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjects);
}

@override final  StudentBalance? balance;

/// Create a copy of StudentListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentListItemCopyWith<_StudentListItem> get copyWith => __$StudentListItemCopyWithImpl<_StudentListItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentListItem&&(identical(other.student, student) || other.student == student)&&const DeepCollectionEquality().equals(other.subjects, _subjects)&&(identical(other.balance, balance) || other.balance == balance));
}


@override
int get hashCode {
    return Object.hash(runtimeType,student,const DeepCollectionEquality().hash(_subjects),balance);
}

@override
String toString() {
    return 'StudentListItem(student: $student, subjects: $subjects, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$StudentListItemCopyWith<$Res> implements $StudentListItemCopyWith<$Res> {
  factory _$StudentListItemCopyWith(_StudentListItem value, $Res Function(_StudentListItem) _then) = __$StudentListItemCopyWithImpl;
@override @useResult
$Res call({
 Student student, List<Subject> subjects, StudentBalance? balance
});


@override $StudentCopyWith<$Res> get student;@override $StudentBalanceCopyWith<$Res>? get balance;

}
/// @nodoc
class __$StudentListItemCopyWithImpl<$Res>
    implements _$StudentListItemCopyWith<$Res> {
  __$StudentListItemCopyWithImpl(this._self, this._then);

  final _StudentListItem _self;
  final $Res Function(_StudentListItem) _then;

/// Create a copy of StudentListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? student = null,Object? subjects = null,Object? balance = freezed,}) {
  return _then(_StudentListItem(
student: null == student ? _self.student : student // ignore: cast_nullable_to_non_nullable
as Student,subjects: null == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<Subject>,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as StudentBalance?,
  ));
}

/// Create a copy of StudentListItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentCopyWith<$Res> get student {
  
  return $StudentCopyWith<$Res>(_self.student, (value) {
    return _then(_self.copyWith(student: value));
  });
}/// Create a copy of StudentListItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StudentBalanceCopyWith<$Res>? get balance {
    if (_self.balance == null) {
    return null;
  }

  return $StudentBalanceCopyWith<$Res>(_self.balance!, (value) {
    return _then(_self.copyWith(balance: value));
  });
}
}

// dart format on

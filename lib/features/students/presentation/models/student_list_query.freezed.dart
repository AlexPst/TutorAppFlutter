// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_list_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudentListQuery {

 String get search; StudentSort get sort; int? get subjectId; bool get onlyDebtors; bool get archived;
/// Create a copy of StudentListQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentListQueryCopyWith<StudentListQuery> get copyWith => _$StudentListQueryCopyWithImpl<StudentListQuery>(this as StudentListQuery, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StudentListQuery;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentListQuery&&(identical(other.search, _this.search) || other.search == _this.search)&&(identical(other.sort, _this.sort) || other.sort == _this.sort)&&(identical(other.subjectId, _this.subjectId) || other.subjectId == _this.subjectId)&&(identical(other.onlyDebtors, _this.onlyDebtors) || other.onlyDebtors == _this.onlyDebtors)&&(identical(other.archived, _this.archived) || other.archived == _this.archived));
}


@override
int get hashCode {
  final _this = this as StudentListQuery;
  return Object.hash(runtimeType,_this.search,_this.sort,_this.subjectId,_this.onlyDebtors,_this.archived);
}

@override
String toString() {
  final _this = this as StudentListQuery;
  return 'StudentListQuery(search: ${_this.search}, sort: ${_this.sort}, subjectId: ${_this.subjectId}, onlyDebtors: ${_this.onlyDebtors}, archived: ${_this.archived})';
}


}

/// @nodoc
abstract mixin class $StudentListQueryCopyWith<$Res>  {
  factory $StudentListQueryCopyWith(StudentListQuery value, $Res Function(StudentListQuery) _then) = _$StudentListQueryCopyWithImpl;
@useResult
$Res call({
 String search, StudentSort sort, int? subjectId, bool onlyDebtors, bool archived
});




}
/// @nodoc
class _$StudentListQueryCopyWithImpl<$Res>
    implements $StudentListQueryCopyWith<$Res> {
  _$StudentListQueryCopyWithImpl(this._self, this._then);

  final StudentListQuery _self;
  final $Res Function(StudentListQuery) _then;

/// Create a copy of StudentListQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? search = null,Object? sort = null,Object? subjectId = freezed,Object? onlyDebtors = null,Object? archived = null,}) {
  return _then(StudentListQuery(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as StudentSort,subjectId: freezed == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as int?,onlyDebtors: null == onlyDebtors ? _self.onlyDebtors : onlyDebtors // ignore: cast_nullable_to_non_nullable
as bool,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentListQuery].
extension StudentListQueryPatterns on StudentListQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentListQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentListQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentListQuery value)  $default,){
final _that = this;
switch (_that) {
case _StudentListQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentListQuery value)?  $default,){
final _that = this;
switch (_that) {
case _StudentListQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String search,  StudentSort sort,  int? subjectId,  bool onlyDebtors,  bool archived)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentListQuery() when $default != null:
return $default(_that.search,_that.sort,_that.subjectId,_that.onlyDebtors,_that.archived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String search,  StudentSort sort,  int? subjectId,  bool onlyDebtors,  bool archived)  $default,) {final _that = this;
switch (_that) {
case _StudentListQuery():
return $default(_that.search,_that.sort,_that.subjectId,_that.onlyDebtors,_that.archived);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String search,  StudentSort sort,  int? subjectId,  bool onlyDebtors,  bool archived)?  $default,) {final _that = this;
switch (_that) {
case _StudentListQuery() when $default != null:
return $default(_that.search,_that.sort,_that.subjectId,_that.onlyDebtors,_that.archived);case _:
  return null;

}
}

}

/// @nodoc


class _StudentListQuery extends StudentListQuery {
  const _StudentListQuery({this.search = '', this.sort = StudentSort.name, this.subjectId, this.onlyDebtors = false, this.archived = false}): super._();
  

@override@JsonKey() final  String search;
@override@JsonKey() final  StudentSort sort;
@override final  int? subjectId;
@override@JsonKey() final  bool onlyDebtors;
@override@JsonKey() final  bool archived;

/// Create a copy of StudentListQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentListQueryCopyWith<_StudentListQuery> get copyWith => __$StudentListQueryCopyWithImpl<_StudentListQuery>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentListQuery&&(identical(other.search, search) || other.search == search)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.subjectId, subjectId) || other.subjectId == subjectId)&&(identical(other.onlyDebtors, onlyDebtors) || other.onlyDebtors == onlyDebtors)&&(identical(other.archived, archived) || other.archived == archived));
}


@override
int get hashCode {
    return Object.hash(runtimeType,search,sort,subjectId,onlyDebtors,archived);
}

@override
String toString() {
    return 'StudentListQuery(search: $search, sort: $sort, subjectId: $subjectId, onlyDebtors: $onlyDebtors, archived: $archived)';
}


}

/// @nodoc
abstract mixin class _$StudentListQueryCopyWith<$Res> implements $StudentListQueryCopyWith<$Res> {
  factory _$StudentListQueryCopyWith(_StudentListQuery value, $Res Function(_StudentListQuery) _then) = __$StudentListQueryCopyWithImpl;
@override @useResult
$Res call({
 String search, StudentSort sort, int? subjectId, bool onlyDebtors, bool archived
});




}
/// @nodoc
class __$StudentListQueryCopyWithImpl<$Res>
    implements _$StudentListQueryCopyWith<$Res> {
  __$StudentListQueryCopyWithImpl(this._self, this._then);

  final _StudentListQuery _self;
  final $Res Function(_StudentListQuery) _then;

/// Create a copy of StudentListQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? search = null,Object? sort = null,Object? subjectId = freezed,Object? onlyDebtors = null,Object? archived = null,}) {
  return _then(_StudentListQuery(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as StudentSort,subjectId: freezed == subjectId ? _self.subjectId : subjectId // ignore: cast_nullable_to_non_nullable
as int?,onlyDebtors: null == onlyDebtors ? _self.onlyDebtors : onlyDebtors // ignore: cast_nullable_to_non_nullable
as bool,archived: null == archived ? _self.archived : archived // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

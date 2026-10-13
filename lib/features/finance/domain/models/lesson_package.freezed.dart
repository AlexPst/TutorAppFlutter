// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LessonPackage {

 int get id; int get enrollmentId; int get lessonsCount;@MoneyConverter() Money get price; DateTime get purchasedAt; String? get note;
/// Create a copy of LessonPackage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonPackageCopyWith<LessonPackage> get copyWith => _$LessonPackageCopyWithImpl<LessonPackage>(this as LessonPackage, _$identity);

  /// Serializes this LessonPackage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LessonPackage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonPackage&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.enrollmentId, _this.enrollmentId) || other.enrollmentId == _this.enrollmentId)&&(identical(other.lessonsCount, _this.lessonsCount) || other.lessonsCount == _this.lessonsCount)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.purchasedAt, _this.purchasedAt) || other.purchasedAt == _this.purchasedAt)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LessonPackage;
  return Object.hash(runtimeType,_this.id,_this.enrollmentId,_this.lessonsCount,_this.price,_this.purchasedAt,_this.note);
}

@override
String toString() {
  final _this = this as LessonPackage;
  return 'LessonPackage(id: ${_this.id}, enrollmentId: ${_this.enrollmentId}, lessonsCount: ${_this.lessonsCount}, price: ${_this.price}, purchasedAt: ${_this.purchasedAt}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $LessonPackageCopyWith<$Res>  {
  factory $LessonPackageCopyWith(LessonPackage value, $Res Function(LessonPackage) _then) = _$LessonPackageCopyWithImpl;
@useResult
$Res call({
 int id, int enrollmentId, int lessonsCount,@MoneyConverter() Money price, DateTime purchasedAt, String? note
});




}
/// @nodoc
class _$LessonPackageCopyWithImpl<$Res>
    implements $LessonPackageCopyWith<$Res> {
  _$LessonPackageCopyWithImpl(this._self, this._then);

  final LessonPackage _self;
  final $Res Function(LessonPackage) _then;

/// Create a copy of LessonPackage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? enrollmentId = null,Object? lessonsCount = null,Object? price = null,Object? purchasedAt = null,Object? note = freezed,}) {
  return _then(LessonPackage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,enrollmentId: null == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as int,lessonsCount: null == lessonsCount ? _self.lessonsCount : lessonsCount // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,purchasedAt: null == purchasedAt ? _self.purchasedAt : purchasedAt // ignore: cast_nullable_to_non_nullable
as DateTime,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LessonPackage].
extension LessonPackagePatterns on LessonPackage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LessonPackage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LessonPackage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LessonPackage value)  $default,){
final _that = this;
switch (_that) {
case _LessonPackage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LessonPackage value)?  $default,){
final _that = this;
switch (_that) {
case _LessonPackage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int enrollmentId,  int lessonsCount, @MoneyConverter()  Money price,  DateTime purchasedAt,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonPackage() when $default != null:
return $default(_that.id,_that.enrollmentId,_that.lessonsCount,_that.price,_that.purchasedAt,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int enrollmentId,  int lessonsCount, @MoneyConverter()  Money price,  DateTime purchasedAt,  String? note)  $default,) {final _that = this;
switch (_that) {
case _LessonPackage():
return $default(_that.id,_that.enrollmentId,_that.lessonsCount,_that.price,_that.purchasedAt,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int enrollmentId,  int lessonsCount, @MoneyConverter()  Money price,  DateTime purchasedAt,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _LessonPackage() when $default != null:
return $default(_that.id,_that.enrollmentId,_that.lessonsCount,_that.price,_that.purchasedAt,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LessonPackage implements LessonPackage {
  const _LessonPackage({required this.id, required this.enrollmentId, required this.lessonsCount, @MoneyConverter() required this.price, required this.purchasedAt, this.note}): assert(lessonsCount > 0, 'A package must contain at least one lesson');
  factory _LessonPackage.fromJson(Map<String, dynamic> json) => _$LessonPackageFromJson(json);

@override final  int id;
@override final  int enrollmentId;
@override final  int lessonsCount;
@override@MoneyConverter() final  Money price;
@override final  DateTime purchasedAt;
@override final  String? note;

/// Create a copy of LessonPackage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonPackageCopyWith<_LessonPackage> get copyWith => __$LessonPackageCopyWithImpl<_LessonPackage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LessonPackageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonPackage&&(identical(other.id, id) || other.id == id)&&(identical(other.enrollmentId, enrollmentId) || other.enrollmentId == enrollmentId)&&(identical(other.lessonsCount, lessonsCount) || other.lessonsCount == lessonsCount)&&(identical(other.price, price) || other.price == price)&&(identical(other.purchasedAt, purchasedAt) || other.purchasedAt == purchasedAt)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,enrollmentId,lessonsCount,price,purchasedAt,note);
}

@override
String toString() {
    return 'LessonPackage(id: $id, enrollmentId: $enrollmentId, lessonsCount: $lessonsCount, price: $price, purchasedAt: $purchasedAt, note: $note)';
}


}

/// @nodoc
abstract mixin class _$LessonPackageCopyWith<$Res> implements $LessonPackageCopyWith<$Res> {
  factory _$LessonPackageCopyWith(_LessonPackage value, $Res Function(_LessonPackage) _then) = __$LessonPackageCopyWithImpl;
@override @useResult
$Res call({
 int id, int enrollmentId, int lessonsCount,@MoneyConverter() Money price, DateTime purchasedAt, String? note
});




}
/// @nodoc
class __$LessonPackageCopyWithImpl<$Res>
    implements _$LessonPackageCopyWith<$Res> {
  __$LessonPackageCopyWithImpl(this._self, this._then);

  final _LessonPackage _self;
  final $Res Function(_LessonPackage) _then;

/// Create a copy of LessonPackage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? enrollmentId = null,Object? lessonsCount = null,Object? price = null,Object? purchasedAt = null,Object? note = freezed,}) {
  return _then(_LessonPackage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,enrollmentId: null == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as int,lessonsCount: null == lessonsCount ? _self.lessonsCount : lessonsCount // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,purchasedAt: null == purchasedAt ? _self.purchasedAt : purchasedAt // ignore: cast_nullable_to_non_nullable
as DateTime,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$LessonPackageDraft {

 int get enrollmentId; int get lessonsCount; Money get price; DateTime get purchasedAt; String? get note;
/// Create a copy of LessonPackageDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonPackageDraftCopyWith<LessonPackageDraft> get copyWith => _$LessonPackageDraftCopyWithImpl<LessonPackageDraft>(this as LessonPackageDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LessonPackageDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonPackageDraft&&(identical(other.enrollmentId, _this.enrollmentId) || other.enrollmentId == _this.enrollmentId)&&(identical(other.lessonsCount, _this.lessonsCount) || other.lessonsCount == _this.lessonsCount)&&(identical(other.price, _this.price) || other.price == _this.price)&&(identical(other.purchasedAt, _this.purchasedAt) || other.purchasedAt == _this.purchasedAt)&&(identical(other.note, _this.note) || other.note == _this.note));
}


@override
int get hashCode {
  final _this = this as LessonPackageDraft;
  return Object.hash(runtimeType,_this.enrollmentId,_this.lessonsCount,_this.price,_this.purchasedAt,_this.note);
}

@override
String toString() {
  final _this = this as LessonPackageDraft;
  return 'LessonPackageDraft(enrollmentId: ${_this.enrollmentId}, lessonsCount: ${_this.lessonsCount}, price: ${_this.price}, purchasedAt: ${_this.purchasedAt}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $LessonPackageDraftCopyWith<$Res>  {
  factory $LessonPackageDraftCopyWith(LessonPackageDraft value, $Res Function(LessonPackageDraft) _then) = _$LessonPackageDraftCopyWithImpl;
@useResult
$Res call({
 int enrollmentId, int lessonsCount, Money price, DateTime purchasedAt, String? note
});




}
/// @nodoc
class _$LessonPackageDraftCopyWithImpl<$Res>
    implements $LessonPackageDraftCopyWith<$Res> {
  _$LessonPackageDraftCopyWithImpl(this._self, this._then);

  final LessonPackageDraft _self;
  final $Res Function(LessonPackageDraft) _then;

/// Create a copy of LessonPackageDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enrollmentId = null,Object? lessonsCount = null,Object? price = null,Object? purchasedAt = null,Object? note = freezed,}) {
  return _then(LessonPackageDraft(
enrollmentId: null == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as int,lessonsCount: null == lessonsCount ? _self.lessonsCount : lessonsCount // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,purchasedAt: null == purchasedAt ? _self.purchasedAt : purchasedAt // ignore: cast_nullable_to_non_nullable
as DateTime,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LessonPackageDraft].
extension LessonPackageDraftPatterns on LessonPackageDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LessonPackageDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LessonPackageDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LessonPackageDraft value)  $default,){
final _that = this;
switch (_that) {
case _LessonPackageDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LessonPackageDraft value)?  $default,){
final _that = this;
switch (_that) {
case _LessonPackageDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int enrollmentId,  int lessonsCount,  Money price,  DateTime purchasedAt,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonPackageDraft() when $default != null:
return $default(_that.enrollmentId,_that.lessonsCount,_that.price,_that.purchasedAt,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int enrollmentId,  int lessonsCount,  Money price,  DateTime purchasedAt,  String? note)  $default,) {final _that = this;
switch (_that) {
case _LessonPackageDraft():
return $default(_that.enrollmentId,_that.lessonsCount,_that.price,_that.purchasedAt,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int enrollmentId,  int lessonsCount,  Money price,  DateTime purchasedAt,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _LessonPackageDraft() when $default != null:
return $default(_that.enrollmentId,_that.lessonsCount,_that.price,_that.purchasedAt,_that.note);case _:
  return null;

}
}

}

/// @nodoc


class _LessonPackageDraft implements LessonPackageDraft {
  const _LessonPackageDraft({required this.enrollmentId, required this.lessonsCount, required this.price, required this.purchasedAt, this.note}): assert(lessonsCount > 0, 'A package must contain at least one lesson');
  

@override final  int enrollmentId;
@override final  int lessonsCount;
@override final  Money price;
@override final  DateTime purchasedAt;
@override final  String? note;

/// Create a copy of LessonPackageDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonPackageDraftCopyWith<_LessonPackageDraft> get copyWith => __$LessonPackageDraftCopyWithImpl<_LessonPackageDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonPackageDraft&&(identical(other.enrollmentId, enrollmentId) || other.enrollmentId == enrollmentId)&&(identical(other.lessonsCount, lessonsCount) || other.lessonsCount == lessonsCount)&&(identical(other.price, price) || other.price == price)&&(identical(other.purchasedAt, purchasedAt) || other.purchasedAt == purchasedAt)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode {
    return Object.hash(runtimeType,enrollmentId,lessonsCount,price,purchasedAt,note);
}

@override
String toString() {
    return 'LessonPackageDraft(enrollmentId: $enrollmentId, lessonsCount: $lessonsCount, price: $price, purchasedAt: $purchasedAt, note: $note)';
}


}

/// @nodoc
abstract mixin class _$LessonPackageDraftCopyWith<$Res> implements $LessonPackageDraftCopyWith<$Res> {
  factory _$LessonPackageDraftCopyWith(_LessonPackageDraft value, $Res Function(_LessonPackageDraft) _then) = __$LessonPackageDraftCopyWithImpl;
@override @useResult
$Res call({
 int enrollmentId, int lessonsCount, Money price, DateTime purchasedAt, String? note
});




}
/// @nodoc
class __$LessonPackageDraftCopyWithImpl<$Res>
    implements _$LessonPackageDraftCopyWith<$Res> {
  __$LessonPackageDraftCopyWithImpl(this._self, this._then);

  final _LessonPackageDraft _self;
  final $Res Function(_LessonPackageDraft) _then;

/// Create a copy of LessonPackageDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enrollmentId = null,Object? lessonsCount = null,Object? price = null,Object? purchasedAt = null,Object? note = freezed,}) {
  return _then(_LessonPackageDraft(
enrollmentId: null == enrollmentId ? _self.enrollmentId : enrollmentId // ignore: cast_nullable_to_non_nullable
as int,lessonsCount: null == lessonsCount ? _self.lessonsCount : lessonsCount // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as Money,purchasedAt: null == purchasedAt ? _self.purchasedAt : purchasedAt // ignore: cast_nullable_to_non_nullable
as DateTime,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$PackageWithUsage {

 LessonPackage get package; int get usedLessons;
/// Create a copy of PackageWithUsage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageWithUsageCopyWith<PackageWithUsage> get copyWith => _$PackageWithUsageCopyWithImpl<PackageWithUsage>(this as PackageWithUsage, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PackageWithUsage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageWithUsage&&(identical(other.package, _this.package) || other.package == _this.package)&&(identical(other.usedLessons, _this.usedLessons) || other.usedLessons == _this.usedLessons));
}


@override
int get hashCode {
  final _this = this as PackageWithUsage;
  return Object.hash(runtimeType,_this.package,_this.usedLessons);
}

@override
String toString() {
  final _this = this as PackageWithUsage;
  return 'PackageWithUsage(package: ${_this.package}, usedLessons: ${_this.usedLessons})';
}


}

/// @nodoc
abstract mixin class $PackageWithUsageCopyWith<$Res>  {
  factory $PackageWithUsageCopyWith(PackageWithUsage value, $Res Function(PackageWithUsage) _then) = _$PackageWithUsageCopyWithImpl;
@useResult
$Res call({
 LessonPackage package, int usedLessons
});


$LessonPackageCopyWith<$Res> get package;

}
/// @nodoc
class _$PackageWithUsageCopyWithImpl<$Res>
    implements $PackageWithUsageCopyWith<$Res> {
  _$PackageWithUsageCopyWithImpl(this._self, this._then);

  final PackageWithUsage _self;
  final $Res Function(PackageWithUsage) _then;

/// Create a copy of PackageWithUsage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? package = null,Object? usedLessons = null,}) {
  return _then(PackageWithUsage(
package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as LessonPackage,usedLessons: null == usedLessons ? _self.usedLessons : usedLessons // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of PackageWithUsage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LessonPackageCopyWith<$Res> get package {
  
  return $LessonPackageCopyWith<$Res>(_self.package, (value) {
    return _then(_self.copyWith(package: value));
  });
}
}


/// Adds pattern-matching-related methods to [PackageWithUsage].
extension PackageWithUsagePatterns on PackageWithUsage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageWithUsage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageWithUsage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageWithUsage value)  $default,){
final _that = this;
switch (_that) {
case _PackageWithUsage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageWithUsage value)?  $default,){
final _that = this;
switch (_that) {
case _PackageWithUsage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LessonPackage package,  int usedLessons)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageWithUsage() when $default != null:
return $default(_that.package,_that.usedLessons);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LessonPackage package,  int usedLessons)  $default,) {final _that = this;
switch (_that) {
case _PackageWithUsage():
return $default(_that.package,_that.usedLessons);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LessonPackage package,  int usedLessons)?  $default,) {final _that = this;
switch (_that) {
case _PackageWithUsage() when $default != null:
return $default(_that.package,_that.usedLessons);case _:
  return null;

}
}

}

/// @nodoc


class _PackageWithUsage extends PackageWithUsage {
  const _PackageWithUsage({required this.package, required this.usedLessons}): super._();
  

@override final  LessonPackage package;
@override final  int usedLessons;

/// Create a copy of PackageWithUsage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageWithUsageCopyWith<_PackageWithUsage> get copyWith => __$PackageWithUsageCopyWithImpl<_PackageWithUsage>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageWithUsage&&(identical(other.package, package) || other.package == package)&&(identical(other.usedLessons, usedLessons) || other.usedLessons == usedLessons));
}


@override
int get hashCode {
    return Object.hash(runtimeType,package,usedLessons);
}

@override
String toString() {
    return 'PackageWithUsage(package: $package, usedLessons: $usedLessons)';
}


}

/// @nodoc
abstract mixin class _$PackageWithUsageCopyWith<$Res> implements $PackageWithUsageCopyWith<$Res> {
  factory _$PackageWithUsageCopyWith(_PackageWithUsage value, $Res Function(_PackageWithUsage) _then) = __$PackageWithUsageCopyWithImpl;
@override @useResult
$Res call({
 LessonPackage package, int usedLessons
});


@override $LessonPackageCopyWith<$Res> get package;

}
/// @nodoc
class __$PackageWithUsageCopyWithImpl<$Res>
    implements _$PackageWithUsageCopyWith<$Res> {
  __$PackageWithUsageCopyWithImpl(this._self, this._then);

  final _PackageWithUsage _self;
  final $Res Function(_PackageWithUsage) _then;

/// Create a copy of PackageWithUsage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? package = null,Object? usedLessons = null,}) {
  return _then(_PackageWithUsage(
package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as LessonPackage,usedLessons: null == usedLessons ? _self.usedLessons : usedLessons // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of PackageWithUsage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LessonPackageCopyWith<$Res> get package {
  
  return $LessonPackageCopyWith<$Res>(_self.package, (value) {
    return _then(_self.copyWith(package: value));
  });
}
}

// dart format on

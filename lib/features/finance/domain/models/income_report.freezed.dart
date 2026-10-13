// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudentIncome {

 int get studentId; String get studentName;/// Платежи с датой оплаты в периоде.
 Money get received;/// Оплачиваемые занятия вне пакетов, начавшиеся в периоде.
 Money get lessonsCharged;/// Пакеты, оформленные в периоде.
 Money get packagesSold; int get completedLessons; Duration get completedDuration;
/// Create a copy of StudentIncome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentIncomeCopyWith<StudentIncome> get copyWith => _$StudentIncomeCopyWithImpl<StudentIncome>(this as StudentIncome, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StudentIncome;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentIncome&&(identical(other.studentId, _this.studentId) || other.studentId == _this.studentId)&&(identical(other.studentName, _this.studentName) || other.studentName == _this.studentName)&&(identical(other.received, _this.received) || other.received == _this.received)&&(identical(other.lessonsCharged, _this.lessonsCharged) || other.lessonsCharged == _this.lessonsCharged)&&(identical(other.packagesSold, _this.packagesSold) || other.packagesSold == _this.packagesSold)&&(identical(other.completedLessons, _this.completedLessons) || other.completedLessons == _this.completedLessons)&&(identical(other.completedDuration, _this.completedDuration) || other.completedDuration == _this.completedDuration));
}


@override
int get hashCode {
  final _this = this as StudentIncome;
  return Object.hash(runtimeType,_this.studentId,_this.studentName,_this.received,_this.lessonsCharged,_this.packagesSold,_this.completedLessons,_this.completedDuration);
}

@override
String toString() {
  final _this = this as StudentIncome;
  return 'StudentIncome(studentId: ${_this.studentId}, studentName: ${_this.studentName}, received: ${_this.received}, lessonsCharged: ${_this.lessonsCharged}, packagesSold: ${_this.packagesSold}, completedLessons: ${_this.completedLessons}, completedDuration: ${_this.completedDuration})';
}


}

/// @nodoc
abstract mixin class $StudentIncomeCopyWith<$Res>  {
  factory $StudentIncomeCopyWith(StudentIncome value, $Res Function(StudentIncome) _then) = _$StudentIncomeCopyWithImpl;
@useResult
$Res call({
 int studentId, String studentName, Money received, Money lessonsCharged, Money packagesSold, int completedLessons, Duration completedDuration
});




}
/// @nodoc
class _$StudentIncomeCopyWithImpl<$Res>
    implements $StudentIncomeCopyWith<$Res> {
  _$StudentIncomeCopyWithImpl(this._self, this._then);

  final StudentIncome _self;
  final $Res Function(StudentIncome) _then;

/// Create a copy of StudentIncome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? studentId = null,Object? studentName = null,Object? received = null,Object? lessonsCharged = null,Object? packagesSold = null,Object? completedLessons = null,Object? completedDuration = null,}) {
  return _then(StudentIncome(
studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,studentName: null == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String,received: null == received ? _self.received : received // ignore: cast_nullable_to_non_nullable
as Money,lessonsCharged: null == lessonsCharged ? _self.lessonsCharged : lessonsCharged // ignore: cast_nullable_to_non_nullable
as Money,packagesSold: null == packagesSold ? _self.packagesSold : packagesSold // ignore: cast_nullable_to_non_nullable
as Money,completedLessons: null == completedLessons ? _self.completedLessons : completedLessons // ignore: cast_nullable_to_non_nullable
as int,completedDuration: null == completedDuration ? _self.completedDuration : completedDuration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [StudentIncome].
extension StudentIncomePatterns on StudentIncome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudentIncome value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudentIncome() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudentIncome value)  $default,){
final _that = this;
switch (_that) {
case _StudentIncome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudentIncome value)?  $default,){
final _that = this;
switch (_that) {
case _StudentIncome() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int studentId,  String studentName,  Money received,  Money lessonsCharged,  Money packagesSold,  int completedLessons,  Duration completedDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudentIncome() when $default != null:
return $default(_that.studentId,_that.studentName,_that.received,_that.lessonsCharged,_that.packagesSold,_that.completedLessons,_that.completedDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int studentId,  String studentName,  Money received,  Money lessonsCharged,  Money packagesSold,  int completedLessons,  Duration completedDuration)  $default,) {final _that = this;
switch (_that) {
case _StudentIncome():
return $default(_that.studentId,_that.studentName,_that.received,_that.lessonsCharged,_that.packagesSold,_that.completedLessons,_that.completedDuration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int studentId,  String studentName,  Money received,  Money lessonsCharged,  Money packagesSold,  int completedLessons,  Duration completedDuration)?  $default,) {final _that = this;
switch (_that) {
case _StudentIncome() when $default != null:
return $default(_that.studentId,_that.studentName,_that.received,_that.lessonsCharged,_that.packagesSold,_that.completedLessons,_that.completedDuration);case _:
  return null;

}
}

}

/// @nodoc


class _StudentIncome extends StudentIncome {
  const _StudentIncome({required this.studentId, required this.studentName, this.received = Money.zero, this.lessonsCharged = Money.zero, this.packagesSold = Money.zero, this.completedLessons = 0, this.completedDuration = Duration.zero}): super._();
  

@override final  int studentId;
@override final  String studentName;
/// Платежи с датой оплаты в периоде.
@override@JsonKey() final  Money received;
/// Оплачиваемые занятия вне пакетов, начавшиеся в периоде.
@override@JsonKey() final  Money lessonsCharged;
/// Пакеты, оформленные в периоде.
@override@JsonKey() final  Money packagesSold;
@override@JsonKey() final  int completedLessons;
@override@JsonKey() final  Duration completedDuration;

/// Create a copy of StudentIncome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudentIncomeCopyWith<_StudentIncome> get copyWith => __$StudentIncomeCopyWithImpl<_StudentIncome>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudentIncome&&(identical(other.studentId, studentId) || other.studentId == studentId)&&(identical(other.studentName, studentName) || other.studentName == studentName)&&(identical(other.received, received) || other.received == received)&&(identical(other.lessonsCharged, lessonsCharged) || other.lessonsCharged == lessonsCharged)&&(identical(other.packagesSold, packagesSold) || other.packagesSold == packagesSold)&&(identical(other.completedLessons, completedLessons) || other.completedLessons == completedLessons)&&(identical(other.completedDuration, completedDuration) || other.completedDuration == completedDuration));
}


@override
int get hashCode {
    return Object.hash(runtimeType,studentId,studentName,received,lessonsCharged,packagesSold,completedLessons,completedDuration);
}

@override
String toString() {
    return 'StudentIncome(studentId: $studentId, studentName: $studentName, received: $received, lessonsCharged: $lessonsCharged, packagesSold: $packagesSold, completedLessons: $completedLessons, completedDuration: $completedDuration)';
}


}

/// @nodoc
abstract mixin class _$StudentIncomeCopyWith<$Res> implements $StudentIncomeCopyWith<$Res> {
  factory _$StudentIncomeCopyWith(_StudentIncome value, $Res Function(_StudentIncome) _then) = __$StudentIncomeCopyWithImpl;
@override @useResult
$Res call({
 int studentId, String studentName, Money received, Money lessonsCharged, Money packagesSold, int completedLessons, Duration completedDuration
});




}
/// @nodoc
class __$StudentIncomeCopyWithImpl<$Res>
    implements _$StudentIncomeCopyWith<$Res> {
  __$StudentIncomeCopyWithImpl(this._self, this._then);

  final _StudentIncome _self;
  final $Res Function(_StudentIncome) _then;

/// Create a copy of StudentIncome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? studentId = null,Object? studentName = null,Object? received = null,Object? lessonsCharged = null,Object? packagesSold = null,Object? completedLessons = null,Object? completedDuration = null,}) {
  return _then(_StudentIncome(
studentId: null == studentId ? _self.studentId : studentId // ignore: cast_nullable_to_non_nullable
as int,studentName: null == studentName ? _self.studentName : studentName // ignore: cast_nullable_to_non_nullable
as String,received: null == received ? _self.received : received // ignore: cast_nullable_to_non_nullable
as Money,lessonsCharged: null == lessonsCharged ? _self.lessonsCharged : lessonsCharged // ignore: cast_nullable_to_non_nullable
as Money,packagesSold: null == packagesSold ? _self.packagesSold : packagesSold // ignore: cast_nullable_to_non_nullable
as Money,completedLessons: null == completedLessons ? _self.completedLessons : completedLessons // ignore: cast_nullable_to_non_nullable
as int,completedDuration: null == completedDuration ? _self.completedDuration : completedDuration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc
mixin _$IncomeReport {

 DatePeriod get period;/// Только ученики с движением в периоде; сначала с большей суммой
/// поступлений, затем начислений.
 List<StudentIncome> get students;
/// Create a copy of IncomeReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomeReportCopyWith<IncomeReport> get copyWith => _$IncomeReportCopyWithImpl<IncomeReport>(this as IncomeReport, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as IncomeReport;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomeReport&&(identical(other.period, _this.period) || other.period == _this.period)&&const DeepCollectionEquality().equals(other.students, _this.students));
}


@override
int get hashCode {
  final _this = this as IncomeReport;
  return Object.hash(runtimeType,_this.period,const DeepCollectionEquality().hash(_this.students));
}

@override
String toString() {
  final _this = this as IncomeReport;
  return 'IncomeReport(period: ${_this.period}, students: ${_this.students})';
}


}

/// @nodoc
abstract mixin class $IncomeReportCopyWith<$Res>  {
  factory $IncomeReportCopyWith(IncomeReport value, $Res Function(IncomeReport) _then) = _$IncomeReportCopyWithImpl;
@useResult
$Res call({
 DatePeriod period, List<StudentIncome> students
});




}
/// @nodoc
class _$IncomeReportCopyWithImpl<$Res>
    implements $IncomeReportCopyWith<$Res> {
  _$IncomeReportCopyWithImpl(this._self, this._then);

  final IncomeReport _self;
  final $Res Function(IncomeReport) _then;

/// Create a copy of IncomeReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = null,Object? students = null,}) {
  return _then(IncomeReport(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as DatePeriod,students: null == students ? _self.students : students // ignore: cast_nullable_to_non_nullable
as List<StudentIncome>,
  ));
}

}


/// Adds pattern-matching-related methods to [IncomeReport].
extension IncomeReportPatterns on IncomeReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomeReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomeReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomeReport value)  $default,){
final _that = this;
switch (_that) {
case _IncomeReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomeReport value)?  $default,){
final _that = this;
switch (_that) {
case _IncomeReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DatePeriod period,  List<StudentIncome> students)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomeReport() when $default != null:
return $default(_that.period,_that.students);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DatePeriod period,  List<StudentIncome> students)  $default,) {final _that = this;
switch (_that) {
case _IncomeReport():
return $default(_that.period,_that.students);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DatePeriod period,  List<StudentIncome> students)?  $default,) {final _that = this;
switch (_that) {
case _IncomeReport() when $default != null:
return $default(_that.period,_that.students);case _:
  return null;

}
}

}

/// @nodoc


class _IncomeReport extends IncomeReport {
  const _IncomeReport({required this.period, required  List<StudentIncome> students}): _students = students,super._();
  

@override final  DatePeriod period;
/// Только ученики с движением в периоде; сначала с большей суммой
/// поступлений, затем начислений.
 final  List<StudentIncome> _students;
/// Только ученики с движением в периоде; сначала с большей суммой
/// поступлений, затем начислений.
@override List<StudentIncome> get students {
  if (_students is EqualUnmodifiableListView) return _students;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_students);
}


/// Create a copy of IncomeReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomeReportCopyWith<_IncomeReport> get copyWith => __$IncomeReportCopyWithImpl<_IncomeReport>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomeReport&&(identical(other.period, period) || other.period == period)&&const DeepCollectionEquality().equals(other.students, _students));
}


@override
int get hashCode {
    return Object.hash(runtimeType,period,const DeepCollectionEquality().hash(_students));
}

@override
String toString() {
    return 'IncomeReport(period: $period, students: $students)';
}


}

/// @nodoc
abstract mixin class _$IncomeReportCopyWith<$Res> implements $IncomeReportCopyWith<$Res> {
  factory _$IncomeReportCopyWith(_IncomeReport value, $Res Function(_IncomeReport) _then) = __$IncomeReportCopyWithImpl;
@override @useResult
$Res call({
 DatePeriod period, List<StudentIncome> students
});




}
/// @nodoc
class __$IncomeReportCopyWithImpl<$Res>
    implements _$IncomeReportCopyWith<$Res> {
  __$IncomeReportCopyWithImpl(this._self, this._then);

  final _IncomeReport _self;
  final $Res Function(_IncomeReport) _then;

/// Create a copy of IncomeReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = null,Object? students = null,}) {
  return _then(_IncomeReport(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as DatePeriod,students: null == students ? _self._students : students // ignore: cast_nullable_to_non_nullable
as List<StudentIncome>,
  ));
}


}

// dart format on

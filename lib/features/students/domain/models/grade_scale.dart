import 'package:freezed_annotation/freezed_annotation.dart';

part 'grade_scale.freezed.dart';
part 'grade_scale.g.dart';

/// Шкала оценок ученика: целые значения от [min] до [max] включительно.
@freezed
abstract class GradeScale with _$GradeScale {
  @Assert('min < max', 'Scale minimum must be less than maximum')
  const factory GradeScale({required int min, required int max}) = _GradeScale;

  const GradeScale._();

  factory GradeScale.fromJson(Map<String, dynamic> json) =>
      _$GradeScaleFromJson(json);

  static const fivePoint = GradeScale(min: 2, max: 5);
  static const tenPoint = GradeScale(min: 1, max: 10);
  static const percent = GradeScale(min: 0, max: 100);

  static const presets = [fivePoint, tenPoint, percent];

  bool contains(int grade) => grade >= min && grade <= max;

  /// Оценка, приведённая к диапазону 0..1. Позволяет сравнивать динамику
  /// независимо от шкалы.
  double normalize(int grade) => (grade - min) / (max - min);
}

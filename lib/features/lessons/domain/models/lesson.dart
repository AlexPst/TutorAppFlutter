import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

@freezed
abstract class Lesson with _$Lesson {
  const factory Lesson({
    required int id,
    required int enrollmentId,
    required DateTime startsAt,
    required Duration duration,
    @Default(LessonStatus.planned) LessonStatus status,

    /// Стоимость занятия. Фиксируется при создании, чтобы смена ставки
    /// направления не меняла прошлые занятия.
    @MoneyConverter() required Money price,

    /// Пакет, из которого списано занятие. Задаётся только для оплачиваемых
    /// статусов.
    int? packageId,
    String? topic,
    String? note,
  }) = _Lesson;

  const Lesson._();

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  DateTime get endsAt => startsAt.add(duration);

  bool get isPaidByPackage => packageId != null;

  /// Сумма, начисляемая ученику за это занятие.
  Money get charge =>
      status.isBillable && !isPaidByPackage ? price : Money.zero;
}

/// Данные для создания занятия. Новое занятие всегда запланировано.
@freezed
abstract class LessonDraft with _$LessonDraft {
  const factory LessonDraft({
    required int enrollmentId,
    required DateTime startsAt,
    required Duration duration,
    required Money price,
    String? topic,
    String? note,
  }) = _LessonDraft;
}

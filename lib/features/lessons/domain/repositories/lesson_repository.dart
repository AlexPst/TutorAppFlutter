import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_details.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';

abstract interface class LessonRepository {
  /// Занятия по времени начала. Все фильтры необязательны и комбинируются
  /// через «И»; [period] отбирает занятия, начинающиеся в нём.
  Stream<List<LessonDetails>> watchLessons({
    DatePeriod? period,
    int? studentId,
    int? enrollmentId,
    Set<LessonStatus>? statuses,
  });

  /// Ближайшие запланированные занятия, начиная с [from].
  Stream<List<LessonDetails>> watchUpcoming({
    required DateTime from,
    int limit = 10,
    int? studentId,
  });

  /// Запланированные занятия, которые уже закончились к [now], — их нужно
  /// отметить. Сначала самые старые.
  Stream<List<LessonDetails>> watchUnmarked({required DateTime now});

  /// `null`, если занятие удалено.
  Stream<LessonDetails?> watchLesson(int id);

  Future<Lesson?> getLesson(int id);

  Future<int> createLesson(LessonDraft draft);

  /// Сохраняет все поля занятия, включая статус и пакет. Согласованность
  /// оплаты обеспечивает вызывающий use case. Бросает `NotFoundFailure`,
  /// если занятия нет.
  Future<void> updateLesson(Lesson lesson);

  /// Удаляет занятие и его запись прогресса. Занятие, списанное из пакета,
  /// возвращается в пакет.
  Future<void> deleteLesson(int id);
}

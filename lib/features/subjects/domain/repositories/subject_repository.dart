import 'package:tutor_app/features/subjects/domain/models/subject.dart';

abstract interface class SubjectRepository {
  /// Предметы по алфавиту.
  Stream<List<Subject>> watchSubjects();

  /// Бросает `ConflictFailure`, если предмет с таким названием уже есть
  /// (без учёта регистра).
  Future<int> createSubject(String name);

  /// Бросает `ConflictFailure` при совпадении названия и `NotFoundFailure`,
  /// если предмета нет.
  Future<void> renameSubject(int id, String name);

  /// Бросает `ConflictFailure`, если по предмету есть направления.
  Future<void> deleteSubject(int id);
}

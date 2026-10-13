import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/features/subjects/data/mappers/subject_mapper.dart';
import 'package:tutor_app/features/subjects/domain/models/subject.dart';
import 'package:tutor_app/features/subjects/domain/repositories/subject_repository.dart';

class DriftSubjectRepository implements SubjectRepository {
  DriftSubjectRepository(this._db);

  final AppDatabase _db;

  @override
  Stream<List<Subject>> watchSubjects() => _db
      .select(_db.subjects)
      .watch()
      .map(
        (rows) => rows.map((row) => row.toModel()).toList()
          ..sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
          ),
      );

  @override
  Future<int> createSubject(String name) => _db.transaction(() async {
    final normalized = name.trim();
    await _ensureNameIsFree(normalized);
    return _db
        .into(_db.subjects)
        .insert(SubjectsCompanion.insert(name: normalized));
  });

  @override
  Future<void> renameSubject(int id, String name) => _db.transaction(() async {
    final normalized = name.trim();
    await _ensureNameIsFree(normalized, exceptId: id);
    final updated =
        await (_db.update(_db.subjects)..where((t) => t.id.equals(id))).write(
          SubjectsCompanion(name: Value(normalized)),
        );
    if (updated == 0) {
      throw const NotFoundFailure(FailureReason.subjectNotFound);
    }
  });

  @override
  Future<void> deleteSubject(int id) => _db.transaction(() async {
    final usage = _db.enrollments.id.count();
    final enrollmentsCount =
        await (_db.selectOnly(_db.enrollments)
              ..addColumns([usage])
              ..where(_db.enrollments.subjectId.equals(id)))
            .map((row) => row.read(usage) ?? 0)
            .getSingle();
    if (enrollmentsCount > 0) {
      throw const ConflictFailure(FailureReason.subjectInUse);
    }
    await (_db.delete(_db.subjects)..where((t) => t.id.equals(id))).go();
  });

  /// SQLite сравнивает без учёта регистра только латиницу, поэтому
  /// названия сравниваются в Dart. Предметов единицы, это дёшево.
  Future<void> _ensureNameIsFree(String name, {int? exceptId}) async {
    final lowerName = name.toLowerCase();
    final subjects = await _db.select(_db.subjects).get();
    final taken = subjects.any(
      (row) => row.id != exceptId && row.name.toLowerCase() == lowerName,
    );
    if (taken) {
      throw ConflictFailure(FailureReason.subjectNameTaken, {'name': name});
    }
  }
}

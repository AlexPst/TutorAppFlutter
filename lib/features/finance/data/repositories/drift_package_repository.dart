import 'package:drift/drift.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/features/finance/data/mappers/package_mapper.dart';
import 'package:tutor_app/features/finance/domain/models/lesson_package.dart';
import 'package:tutor_app/features/finance/domain/repositories/package_repository.dart';

class DriftPackageRepository implements PackageRepository {
  DriftPackageRepository(this._db);

  final AppDatabase _db;

  late final Expression<int> _usedLessons = _db.lessons.id.count();

  @override
  Stream<List<PackageWithUsage>> watchPackages({
    int? studentId,
    int? enrollmentId,
  }) {
    final packages = _db.lessonPackages;
    final filters = <Expression<bool>>[
      if (studentId != null) _db.enrollments.studentId.equals(studentId),
      if (enrollmentId != null) packages.enrollmentId.equals(enrollmentId),
    ];

    final query = _packagesQuery()
      ..orderBy([
        OrderingTerm.desc(packages.purchasedAt),
        OrderingTerm.desc(packages.id),
      ]);
    if (filters.isNotEmpty) query.where(filters.reduce((a, b) => a & b));

    return query.watch().map((rows) => rows.map(_toUsage).toList());
  }

  @override
  Future<List<PackageWithUsage>> getAvailablePackages(int enrollmentId) async {
    final packages = _db.lessonPackages;
    final query =
        _packagesQuery(
            having: _usedLessons.isSmallerThan(packages.lessonsCount),
          )
          ..where(packages.enrollmentId.equals(enrollmentId))
          ..orderBy([
            OrderingTerm.asc(packages.purchasedAt),
            OrderingTerm.asc(packages.id),
          ]);
    final rows = await query.get();
    return rows.map(_toUsage).toList();
  }

  @override
  Future<LessonPackage?> getPackage(int id) async {
    final row = await (_db.select(
      _db.lessonPackages,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return row?.toModel();
  }

  @override
  Future<int> createPackage(LessonPackageDraft draft) =>
      _db.into(_db.lessonPackages).insert(draft.toCompanion());

  @override
  Future<void> updatePackage(LessonPackage package) => _db.transaction(
    () async {
      final used = await _countUsedLessons(package.id);
      if (package.lessonsCount < used) {
        throw ConflictFailure(FailureReason.packageBelowUsage, {'used': used});
      }
      final updated =
          await (_db.update(_db.lessonPackages)
                ..where((t) => t.id.equals(package.id)))
              .write(package.toUpdateCompanion(DateTime.now()));
      if (updated == 0) {
        throw const NotFoundFailure(FailureReason.packageNotFound);
      }
    },
  );

  @override
  Future<void> deletePackage(int id) =>
      (_db.delete(_db.lessonPackages)..where((t) => t.id.equals(id))).go();

  JoinedSelectStatement<HasResultSet, dynamic> _packagesQuery({
    Expression<bool>? having,
  }) {
    final packages = _db.lessonPackages;
    return _db.select(packages).join([
        leftOuterJoin(
          _db.lessons,
          _db.lessons.packageId.equalsExp(packages.id),
          useColumns: false,
        ),
        innerJoin(
          _db.enrollments,
          _db.enrollments.id.equalsExp(packages.enrollmentId),
          useColumns: false,
        ),
      ])
      ..addColumns([_usedLessons])
      ..groupBy([packages.id], having: having);
  }

  PackageWithUsage _toUsage(TypedResult row) => PackageWithUsage(
    package: row.readTable(_db.lessonPackages).toModel(),
    usedLessons: row.read(_usedLessons) ?? 0,
  );

  Future<int> _countUsedLessons(int packageId) {
    final count = _db.lessons.id.count();
    return (_db.selectOnly(_db.lessons)
          ..addColumns([count])
          ..where(_db.lessons.packageId.equals(packageId)))
        .map((row) => row.read(count) ?? 0)
        .getSingle();
  }
}

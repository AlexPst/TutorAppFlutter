import 'package:tutor_app/features/finance/domain/models/lesson_package.dart';

abstract interface class PackageRepository {
  /// Пакеты ученика или направления с числом использованных занятий,
  /// сначала новые.
  Stream<List<PackageWithUsage>> watchPackages({
    int? studentId,
    int? enrollmentId,
  });

  /// Пакеты направления, в которых остались занятия, в порядке списания
  /// (FIFO: сначала самые старые).
  Future<List<PackageWithUsage>> getAvailablePackages(int enrollmentId);

  Future<LessonPackage?> getPackage(int id);

  Future<int> createPackage(LessonPackageDraft draft);

  /// Меняет количество занятий, цену, дату и заметку. Бросает
  /// `ConflictFailure`, если занятий станет меньше, чем уже списано,
  /// и `NotFoundFailure`, если пакета нет.
  Future<void> updatePackage(LessonPackage package);

  /// Занятия, списанные из пакета, становятся платными по своей стоимости.
  Future<void> deletePackage(int id);
}

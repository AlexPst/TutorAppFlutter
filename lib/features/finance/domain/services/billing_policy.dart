import 'package:tutor_app/features/finance/domain/models/lesson_package.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';

/// Правило оплаты занятия: из какого пакета его списать.
///
/// Сумма к оплате не хранится, а вычисляется из статуса и пакета
/// (`Lesson.charge`), поэтому достаточно правильно выбрать пакет:
/// `null` означает «не из пакета» — занятие либо не оплачивается,
/// либо начисляется по своей стоимости.
abstract final class BillingPolicy {
  /// [previous] — занятие до изменения (`null` для нового), [next] — после.
  /// [availablePackages] — пакеты направления `next` с остатком, в порядке
  /// списания (FIFO).
  static int? packageFor({
    required Lesson? previous,
    required Lesson next,
    required List<PackageWithUsage> availablePackages,
  }) {
    // 1. Неоплачиваемый статус: занятие возвращается в пакет, если было
    //    из него списано, и ничего не начисляется.
    if (!next.status.isBillable) return null;

    // 2. Занятие уже оплачивалось по этому направлению: смена одного
    //    оплачиваемого статуса на другой не меняет способ оплаты —
    //    иначе «Проведено» → «Пропуск» списывало бы занятие повторно.
    if (previous != null &&
        previous.status.isBillable &&
        previous.enrollmentId == next.enrollmentId) {
      return previous.packageId;
    }

    // 3. Занятие становится оплачиваемым: списываем из самого старого
    //    пакета с остатком, а если его нет — начисляем стоимость.
    for (final package in availablePackages) {
      if (package.package.enrollmentId == next.enrollmentId &&
          package.remainingLessons > 0) {
        return package.package.id;
      }
    }
    return null;
  }
}

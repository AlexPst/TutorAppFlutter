import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/core/domain/money.dart';
import 'package:tutor_app/features/finance/domain/models/lesson_package.dart';
import 'package:tutor_app/features/finance/domain/services/billing_policy.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson.dart';
import 'package:tutor_app/features/lessons/domain/models/lesson_status.dart';

PackageWithUsage _package(int id, {int enrollmentId = 1, int used = 0}) =>
    PackageWithUsage(
      package: LessonPackage(
        id: id,
        enrollmentId: enrollmentId,
        lessonsCount: 4,
        price: const Money.rubles(5000),
        purchasedAt: DateTime(2026, 10, 1),
      ),
      usedLessons: used,
    );

void main() {
  final planned = Lesson(
    id: 1,
    enrollmentId: 1,
    startsAt: DateTime(2026, 10, 13, 18),
    duration: const Duration(minutes: 60),
    price: const Money.rubles(1500),
  );

  int? decide(
    Lesson? previous,
    LessonStatus status, [
    List<PackageWithUsage> packages = const [],
  ]) => BillingPolicy.packageFor(
    previous: previous,
    next: (previous ?? planned).copyWith(status: status),
    availablePackages: packages,
  );

  test('неоплачиваемый статус никогда не списывается из пакета', () {
    final fromPackage = planned.copyWith(
      status: LessonStatus.completed,
      packageId: 7,
    );
    expect(
      decide(fromPackage, LessonStatus.cancelledByTutor, [_package(7)]),
      isNull,
    );
    expect(decide(fromPackage, LessonStatus.planned, [_package(7)]), isNull);
  });

  test('оплачиваемый статус берёт самый старый пакет с остатком', () {
    expect(
      decide(planned, LessonStatus.completed, [_package(3), _package(5)]),
      3,
    );
  });

  test('пропускает исчерпанные пакеты и пакеты другого направления', () {
    expect(
      decide(planned, LessonStatus.noShow, [
        _package(3, used: 4),
        _package(4, enrollmentId: 2),
        _package(5),
      ]),
      5,
    );
  });

  test('без пакетов — начисление по стоимости', () {
    expect(decide(planned, LessonStatus.completed), isNull);
  });

  test('смена оплачиваемого статуса на другой не меняет способ оплаты', () {
    final fromPackage = planned.copyWith(
      status: LessonStatus.completed,
      packageId: 7,
    );
    final paidByMoney = planned.copyWith(status: LessonStatus.completed);

    expect(decide(fromPackage, LessonStatus.noShow, [_package(9)]), 7);
    expect(decide(paidByMoney, LessonStatus.noShow, [_package(9)]), isNull);
  });

  test('новое занятие сразу в оплачиваемом статусе', () {
    expect(decide(null, LessonStatus.completed, [_package(3)]), 3);
  });
}

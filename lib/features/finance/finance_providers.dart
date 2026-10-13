import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/core/database/database_providers.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/features/finance/data/repositories/drift_package_repository.dart';
import 'package:tutor_app/features/finance/data/repositories/drift_payment_repository.dart';
import 'package:tutor_app/features/finance/domain/repositories/package_repository.dart';
import 'package:tutor_app/features/finance/domain/repositories/payment_repository.dart';
import 'package:tutor_app/features/finance/domain/usecases/save_payment.dart';
import 'package:tutor_app/features/students/students_providers.dart';

part 'finance_providers.g.dart';

@Riverpod(keepAlive: true)
PaymentRepository paymentRepository(Ref ref) =>
    DriftPaymentRepository(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
PackageRepository packageRepository(Ref ref) =>
    DriftPackageRepository(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
SavePaymentUseCase savePaymentUseCase(Ref ref) => SavePaymentUseCase(
  payments: ref.watch(paymentRepositoryProvider),
  students: ref.watch(studentRepositoryProvider),
  transaction: ref.watch(transactionRunnerProvider),
  clock: ref.watch(clockProvider),
);

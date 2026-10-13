import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/database/drift_transaction_runner.dart';
import 'package:tutor_app/core/domain/transaction_runner.dart';

part 'database_providers.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
}

@Riverpod(keepAlive: true)
TransactionRunner transactionRunner(Ref ref) =>
    DriftTransactionRunner(ref.watch(appDatabaseProvider));

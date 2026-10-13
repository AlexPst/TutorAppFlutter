import 'package:tutor_app/core/database/app_database.dart';
import 'package:tutor_app/core/domain/transaction_runner.dart';

/// Транзакции Drift привязаны к зоне, поэтому вызовы репозиториев внутри
/// [run] автоматически попадают в одну транзакцию.
class DriftTransactionRunner implements TransactionRunner {
  DriftTransactionRunner(this._db);

  final AppDatabase _db;

  @override
  Future<T> run<T>(Future<T> Function() action) => _db.transaction(action);
}

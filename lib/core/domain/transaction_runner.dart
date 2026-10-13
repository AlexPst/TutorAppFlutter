/// Выполняет [action] атомарно: все изменения через репозитории внутри
/// него либо применяются целиком, либо откатываются.
abstract interface class TransactionRunner {
  Future<T> run<T>(Future<T> Function() action);
}

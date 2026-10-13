import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/features/progress/domain/models/progress_entry.dart';
import 'package:tutor_app/features/progress/progress_providers.dart';

part 'progress_entry_form_controller.g.dart';

/// Сохранение и удаление записи прогресса. Методы возвращают `true`
/// при успехе; ошибка попадает в состояние и показывается экраном.
@riverpod
class ProgressEntryFormController extends _$ProgressEntryFormController {
  @override
  FutureOr<void> build() {}

  Future<bool> createEntry(ProgressEntryDraft draft) =>
      _run(() => ref.read(saveProgressEntryUseCaseProvider).create(draft));

  Future<bool> updateEntry(ProgressEntry entry) =>
      _run(() => ref.read(saveProgressEntryUseCaseProvider).update(entry));

  Future<bool> deleteEntry(int entryId) =>
      _run(() => ref.read(progressRepositoryProvider).deleteEntry(entryId));

  Future<bool> _run(Future<void> Function() action) async {
    state = const AsyncLoading();
    try {
      await action();
      if (ref.mounted) state = const AsyncData(null);
      return true;
    } on Object catch (error, stackTrace) {
      if (ref.mounted) state = AsyncError(error, stackTrace);
      return false;
    }
  }
}

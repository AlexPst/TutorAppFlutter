import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/core/database/database_providers.dart';
import 'package:tutor_app/core/providers/clock_provider.dart';
import 'package:tutor_app/features/lessons/lessons_providers.dart';
import 'package:tutor_app/features/progress/data/repositories/drift_progress_repository.dart';
import 'package:tutor_app/features/progress/domain/repositories/progress_repository.dart';
import 'package:tutor_app/features/progress/domain/usecases/save_progress_entry.dart';
import 'package:tutor_app/features/students/students_providers.dart';

part 'progress_providers.g.dart';

@Riverpod(keepAlive: true)
ProgressRepository progressRepository(Ref ref) =>
    DriftProgressRepository(ref.watch(appDatabaseProvider));

@Riverpod(keepAlive: true)
SaveProgressEntryUseCase saveProgressEntryUseCase(Ref ref) =>
    SaveProgressEntryUseCase(
      progress: ref.watch(progressRepositoryProvider),
      lessons: ref.watch(lessonRepositoryProvider),
      students: ref.watch(studentRepositoryProvider),
      transaction: ref.watch(transactionRunnerProvider),
      clock: ref.watch(clockProvider),
    );

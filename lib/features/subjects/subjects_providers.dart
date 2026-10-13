import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/core/database/database_providers.dart';
import 'package:tutor_app/features/subjects/data/repositories/drift_subject_repository.dart';
import 'package:tutor_app/features/subjects/domain/repositories/subject_repository.dart';

part 'subjects_providers.g.dart';

@Riverpod(keepAlive: true)
SubjectRepository subjectRepository(Ref ref) =>
    DriftSubjectRepository(ref.watch(appDatabaseProvider));

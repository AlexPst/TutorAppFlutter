import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/features/subjects/domain/models/subject.dart';
import 'package:tutor_app/features/subjects/subjects_providers.dart';

part 'subjects_list_provider.g.dart';

@riverpod
Stream<List<Subject>> subjectsList(Ref ref) =>
    ref.watch(subjectRepositoryProvider).watchSubjects();

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tutor_app/core/database/database_providers.dart';
import 'package:tutor_app/features/students/data/repositories/drift_student_repository.dart';
import 'package:tutor_app/features/students/domain/repositories/student_repository.dart';

part 'students_providers.g.dart';

@Riverpod(keepAlive: true)
StudentRepository studentRepository(Ref ref) =>
    DriftStudentRepository(ref.watch(appDatabaseProvider));

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clock_provider.g.dart';

/// Источник текущего времени. В тестах подменяется фиксированным моментом.
@Riverpod(keepAlive: true)
DateTime Function() clock(Ref ref) => DateTime.now;

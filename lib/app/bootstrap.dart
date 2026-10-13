import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tutor_app/app/app.dart';
import 'package:tutor_app/core/errors/app_error_handling.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  installErrorHandlers();
  // Данные дат для всех локалей: язык можно сменить на лету.
  await initializeDateFormatting();
  runApp(
    const ProviderScope(observers: [AppProviderObserver()], child: TutorApp()),
  );
}

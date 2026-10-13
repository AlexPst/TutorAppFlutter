import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tutor_app/core/domain/date_period.dart';
import 'package:tutor_app/core/domain/failure.dart';
import 'package:tutor_app/core/domain/field_error.dart';
import 'package:tutor_app/l10n/l10n.dart';

final _cyrillic = RegExp('[А-Яа-яЁё]');

void main() {
  late AppLocalizations ru;
  late AppLocalizations en;

  setUpAll(() async {
    await initializeDateFormatting();
    ru = lookupAppLocalizations(const Locale('ru'));
    en = lookupAppLocalizations(const Locale('en'));
  });

  test('склонения по правилам языка', () {
    expect([1, 2, 5, 11, 21, 22, 25, 111].map(ru.lessonsCount), [
      '1 занятие',
      '2 занятия',
      '5 занятий',
      '11 занятий',
      '21 занятие',
      '22 занятия',
      '25 занятий',
      '111 занятий',
    ]);
    expect([1, 2].map(en.lessonsCount), ['1 lesson', '2 lessons']);
    expect(ru.paymentsCount(3), '3 платежа');
    expect(en.studentsCount(1), '1 student');
  });

  test('длительность', () {
    expect(ru.duration(const Duration(minutes: 45)), '45 мин');
    expect(ru.duration(const Duration(minutes: 60)), '1 ч');
    expect(ru.duration(const Duration(minutes: 90)), '1 ч 30 мин');
    expect(en.duration(const Duration(minutes: 90)), '1 h 30 min');
  });

  test('диапазон недели: порядок дня и месяца зависит от языка', () {
    final week = DatePeriod.week(DateTime(2026, 10, 13));
    final crossMonth = DatePeriod.week(DateTime(2026, 9, 30));

    expect(ru.weekRange(week), '12–18 октября');
    expect(en.weekRange(week), 'October 12–18');
    expect(ru.weekRange(crossMonth), '28 сентября – 4 октября');
    expect(en.weekRange(crossMonth), 'September 28 – October 4');
  });

  test('у каждой причины ошибки есть перевод с параметрами', () {
    const args = {'name': 'Chemistry', 'used': 3, 'min': 2, 'max': 5};
    for (final reason in FailureReason.values) {
      final failure = ValidationFailure(reason, args);
      final ruText = ru.failure(failure);
      final enText = en.failure(failure);

      expect(ruText, isNotEmpty, reason: reason.name);
      expect(enText, isNot(contains(_cyrillic)), reason: reason.name);
    }
    expect(
      en.failure(
        const ValidationFailure(FailureReason.gradeOutOfScale, {
          'min': 2,
          'max': 5,
        }),
      ),
      'Grade must be between 2 and 5',
    );
  });

  test('у каждой ошибки поля есть перевод', () {
    for (final error in FieldError.values) {
      expect(ru.fieldError(error), isNotEmpty, reason: error.name);
      expect(en.fieldError(error), isNot(contains(_cyrillic)));
    }
    expect(en.fieldError(FieldError.nameTooLong), 'At most 200 characters');
  });

  test('текст напоминания о долге', () {
    expect(
      ru.debtReminderText('Анна', '4 500 ₽'),
      allOf(startsWith('Здравствуйте, Анна!'), contains('к оплате 4 500 ₽')),
    );
    expect(en.debtReminderText('Anna', '₽4,500'), contains('₽4,500 is due'));
  });

  test('ARB: одинаковые ключи в ru и en, английский без кириллицы', () {
    Map<String, Object?> read(String locale) =>
        jsonDecode(File('lib/l10n/app_$locale.arb').readAsStringSync())
            as Map<String, Object?>;
    final ruKeys = read('ru').keys.where((key) => !key.startsWith('@'));
    final enArb = read('en');
    final enKeys = enArb.keys.where((key) => !key.startsWith('@'));

    expect(enKeys.toSet(), ruKeys.toSet());
    // Названия языков намеренно на своём языке.
    const nativeNames = {'languageRussian'};
    final cyrillicInEnglish = [
      for (final key in enKeys)
        if (!nativeNames.contains(key) &&
            (enArb[key]! as String).contains(_cyrillic))
          key,
    ];
    expect(cyrillicInEnglish, isEmpty);
  });

  test('в коде нет русских строк в обход локализации', () {
    // Строковый литерал с кириллицей; комментарии (// и ///) не считаются.
    final literal = RegExp(r"""'[^'\n]*[А-Яа-яЁё][^'\n]*'""");
    final offenders = <String>[];
    final files = Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where(
          (file) =>
              file.path.endsWith('.dart') &&
              !file.path.endsWith('.g.dart') &&
              !file.path.endsWith('.freezed.dart') &&
              !file.path.startsWith('lib/l10n/'),
        );
    for (final file in files) {
      final lines = file.readAsLinesSync();
      for (final (index, line) in lines.indexed) {
        if (line.trimLeft().startsWith('//')) continue;
        if (literal.hasMatch(line)) offenders.add('${file.path}:${index + 1}');
      }
    }
    expect(offenders, isEmpty);
  });

  test('ошибки бизнес-правил не содержат текста', () {
    // Сообщения собирает UI; в domain — только причина и параметры.
    const failure = NotFoundFailure(FailureReason.lessonNotFound);
    expect(failure.toString(), isNot(contains(_cyrillic)));
  });
}

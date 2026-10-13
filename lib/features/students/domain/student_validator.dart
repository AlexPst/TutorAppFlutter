import 'package:tutor_app/core/domain/field_error.dart';
import 'package:tutor_app/core/domain/money.dart';

/// Правила для данных ученика и направления. Методы проверки возвращают
/// [FieldError] или `null`; текст ошибки подбирает UI по локали.
abstract final class StudentValidator {
  static const maxNameLength = 200;
  static const maxGrade = 1000;
  static const maxRate = Money.rubles(1000000);

  static final _phoneChars = RegExp(r'^[0-9+()\-\s]+$');
  static final _nonDigits = RegExp(r'\D');
  static final _telegramLink = RegExp(
    r'^(?:https?://)?(?:t\.me|telegram\.me)/',
    caseSensitive: false,
  );
  static final _telegramUsername = RegExp(r'^@[A-Za-z0-9_]{5,32}$');

  static FieldError? fullName(String? value) {
    final name = value?.trim() ?? '';
    if (name.isEmpty) return FieldError.nameRequired;
    if (name.length > maxNameLength) return FieldError.nameTooLong;
    return null;
  }

  static FieldError? phone(String? value) {
    final phone = value?.trim() ?? '';
    if (phone.isEmpty) return null;
    final digits = phone.replaceAll(_nonDigits, '').length;
    if (!_phoneChars.hasMatch(phone) || digits < 10 || digits > 15) {
      return FieldError.phoneInvalid;
    }
    return null;
  }

  /// Приводит `user`, `@user`, `t.me/user` к виду `@user`.
  /// Пустой ввод — `null`.
  static String? normalizeTelegram(String? value) {
    final username = (value?.trim() ?? '').replaceFirst(_telegramLink, '');
    if (username.isEmpty) return null;
    return username.startsWith('@') ? username : '@$username';
  }

  static FieldError? telegram(String? value) {
    final username = normalizeTelegram(value);
    if (username == null) return null;
    if (!_telegramUsername.hasMatch(username)) {
      return FieldError.telegramInvalid;
    }
    return null;
  }

  static FieldError? gradeBound(String? value) {
    final number = int.tryParse(value?.trim() ?? '');
    if (number == null) return FieldError.integerRequired;
    if (number < 0 || number > maxGrade) {
      return FieldError.gradeBoundOutOfRange;
    }
    return null;
  }

  static FieldError? gradeScale(int min, int max) =>
      min < max ? null : FieldError.gradeRangeInvalid;

  static FieldError? rate(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return FieldError.priceRequired;
    final rate = Money.tryParse(text);
    if (rate == null) return FieldError.moneyFormat;
    if (rate > maxRate) return FieldError.amountTooLarge;
    return null;
  }

  /// Обрезает пробелы; пустая строка превращается в `null`.
  static String? optionalText(String? value) {
    final text = value?.trim() ?? '';
    return text.isEmpty ? null : text;
  }
}

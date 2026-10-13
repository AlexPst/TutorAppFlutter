import 'package:flutter_test/flutter_test.dart';
import 'package:tutor_app/features/students/domain/student_validator.dart';

void main() {
  test('имя: обязательно и не длиннее 200 символов', () {
    expect(StudentValidator.fullName('  '), isNotNull);
    expect(StudentValidator.fullName('А' * 201), isNotNull);
    expect(StudentValidator.fullName(' Анна '), isNull);
  });

  test('телефон: необязателен, 10–15 цифр, допустимые символы', () {
    expect(StudentValidator.phone(''), isNull);
    expect(StudentValidator.phone('+7 (900) 123-45-67'), isNull);
    expect(StudentValidator.phone('89001234567'), isNull);
    expect(StudentValidator.phone('123'), isNotNull);
    expect(StudentValidator.phone('+7 900 abc-45-67'), isNotNull);
  });

  test('telegram: нормализация ссылок и проверка имени', () {
    expect(StudentValidator.normalizeTelegram(' '), isNull);
    expect(StudentValidator.normalizeTelegram('anna_p'), '@anna_p');
    expect(StudentValidator.normalizeTelegram('@anna_p'), '@anna_p');
    expect(
      StudentValidator.normalizeTelegram('https://t.me/anna_p'),
      '@anna_p',
    );
    expect(StudentValidator.telegram('t.me/anna_p'), isNull);
    expect(StudentValidator.telegram('@ann'), isNotNull);
    expect(StudentValidator.telegram('@анна_п'), isNotNull);
  });

  test('шкала оценок', () {
    expect(StudentValidator.gradeBound('5'), isNull);
    expect(StudentValidator.gradeBound('-1'), isNotNull);
    expect(StudentValidator.gradeBound('1001'), isNotNull);
    expect(StudentValidator.gradeBound('x'), isNotNull);
    expect(StudentValidator.gradeScale(1, 10), isNull);
    expect(StudentValidator.gradeScale(5, 5), isNotNull);
  });

  test('ставка: обязательна, сумма в рублях, с ограничением сверху', () {
    expect(StudentValidator.rate(''), isNotNull);
    expect(StudentValidator.rate('1 500,50'), isNull);
    expect(StudentValidator.rate('abc'), isNotNull);
    expect(StudentValidator.rate('1000001'), isNotNull);
  });

  test('необязательный текст: пробелы превращаются в null', () {
    expect(StudentValidator.optionalText('   '), isNull);
    expect(StudentValidator.optionalText(' заметка '), 'заметка');
  });
}

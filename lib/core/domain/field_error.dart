/// Ошибка значения поля формы. Текст подбирает UI по локали.
enum FieldError {
  nameRequired,

  /// Длиннее `StudentValidator.maxNameLength`.
  nameTooLong,
  phoneInvalid,
  telegramInvalid,
  integerRequired,

  /// Вне `0..StudentValidator.maxGrade`.
  gradeBoundOutOfRange,
  gradeRangeInvalid,
  priceRequired,
  amountRequired,
  moneyFormat,
  amountTooLarge,
  amountNotPositive,
}

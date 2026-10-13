import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In ru, this message translates to:
  /// **'Репетитор'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get navHome;

  /// No description provided for @navSchedule.
  ///
  /// In ru, this message translates to:
  /// **'Расписание'**
  String get navSchedule;

  /// No description provided for @navFinance.
  ///
  /// In ru, this message translates to:
  /// **'Финансы'**
  String get navFinance;

  /// No description provided for @navStudents.
  ///
  /// In ru, this message translates to:
  /// **'Ученики'**
  String get navStudents;

  /// No description provided for @languageRussian.
  ///
  /// In ru, this message translates to:
  /// **'Русский'**
  String get languageRussian;

  /// No description provided for @languageEnglish.
  ///
  /// In ru, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @commonCancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get commonCancel;

  /// No description provided for @commonSave.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get commonSave;

  /// No description provided for @commonDelete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get commonDelete;

  /// No description provided for @commonAdd.
  ///
  /// In ru, this message translates to:
  /// **'Добавить'**
  String get commonAdd;

  /// No description provided for @commonRetry.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get commonRetry;

  /// No description provided for @commonClear.
  ///
  /// In ru, this message translates to:
  /// **'Очистить'**
  String get commonClear;

  /// No description provided for @commonEdit.
  ///
  /// In ru, this message translates to:
  /// **'Редактировать'**
  String get commonEdit;

  /// No description provided for @commonMore.
  ///
  /// In ru, this message translates to:
  /// **'Ещё'**
  String get commonMore;

  /// No description provided for @commonBack.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get commonBack;

  /// No description provided for @commonForward.
  ///
  /// In ru, this message translates to:
  /// **'Вперёд'**
  String get commonForward;

  /// No description provided for @commonToday.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня'**
  String get commonToday;

  /// No description provided for @commonTomorrow.
  ///
  /// In ru, this message translates to:
  /// **'Завтра'**
  String get commonTomorrow;

  /// No description provided for @commonCopiedValue.
  ///
  /// In ru, this message translates to:
  /// **'Скопировано: {value}'**
  String commonCopiedValue(String value);

  /// No description provided for @commonCopyTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Скопировать'**
  String get commonCopyTooltip;

  /// No description provided for @commonNote.
  ///
  /// In ru, this message translates to:
  /// **'Заметка'**
  String get commonNote;

  /// No description provided for @commonTopic.
  ///
  /// In ru, this message translates to:
  /// **'Тема'**
  String get commonTopic;

  /// No description provided for @commonDate.
  ///
  /// In ru, this message translates to:
  /// **'Дата'**
  String get commonDate;

  /// No description provided for @commonTime.
  ///
  /// In ru, this message translates to:
  /// **'Время'**
  String get commonTime;

  /// No description provided for @commonStudent.
  ///
  /// In ru, this message translates to:
  /// **'Ученик'**
  String get commonStudent;

  /// No description provided for @commonStudentRequired.
  ///
  /// In ru, this message translates to:
  /// **'Ученик *'**
  String get commonStudentRequired;

  /// No description provided for @commonSubject.
  ///
  /// In ru, this message translates to:
  /// **'Предмет'**
  String get commonSubject;

  /// No description provided for @commonSubjectRequired.
  ///
  /// In ru, this message translates to:
  /// **'Предмет *'**
  String get commonSubjectRequired;

  /// No description provided for @commonDuration.
  ///
  /// In ru, this message translates to:
  /// **'Длительность'**
  String get commonDuration;

  /// No description provided for @commonPackage.
  ///
  /// In ru, this message translates to:
  /// **'Пакет'**
  String get commonPackage;

  /// No description provided for @commonNoTopic.
  ///
  /// In ru, this message translates to:
  /// **'Тема не указана'**
  String get commonNoTopic;

  /// No description provided for @commonNotFoundMaybeDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Возможно, данные удалили'**
  String get commonNotFoundMaybeDeleted;

  /// No description provided for @commonGrade.
  ///
  /// In ru, this message translates to:
  /// **'Оценка'**
  String get commonGrade;

  /// No description provided for @commonNoGrade.
  ///
  /// In ru, this message translates to:
  /// **'Без оценки'**
  String get commonNoGrade;

  /// No description provided for @commonSelectStudent.
  ///
  /// In ru, this message translates to:
  /// **'Выберите ученика'**
  String get commonSelectStudent;

  /// No description provided for @commonSelectSubject.
  ///
  /// In ru, this message translates to:
  /// **'Выберите предмет'**
  String get commonSelectSubject;

  /// No description provided for @commonAddStudentFirst.
  ///
  /// In ru, this message translates to:
  /// **'Сначала добавьте ученика'**
  String get commonAddStudentFirst;

  /// No description provided for @commonAddStudent.
  ///
  /// In ru, this message translates to:
  /// **'Добавить ученика'**
  String get commonAddStudent;

  /// No description provided for @commonLoading.
  ///
  /// In ru, this message translates to:
  /// **'Загрузка…'**
  String get commonLoading;

  /// No description provided for @leaveWithoutSavingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Выйти без сохранения?'**
  String get leaveWithoutSavingTitle;

  /// No description provided for @leaveWithoutSavingMessage.
  ///
  /// In ru, this message translates to:
  /// **'Внесённые изменения будут потеряны.'**
  String get leaveWithoutSavingMessage;

  /// No description provided for @leaveAction.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get leaveAction;

  /// No description provided for @loadErrorTitle.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось загрузить данные'**
  String get loadErrorTitle;

  /// No description provided for @errorUnexpected.
  ///
  /// In ru, this message translates to:
  /// **'Что-то пошло не так. Попробуйте ещё раз.'**
  String get errorUnexpected;

  /// No description provided for @errorWidgetTitle.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось показать этот блок'**
  String get errorWidgetTitle;

  /// No description provided for @notFoundTitle.
  ///
  /// In ru, this message translates to:
  /// **'Страница не найдена'**
  String get notFoundTitle;

  /// No description provided for @toStudentsList.
  ///
  /// In ru, this message translates to:
  /// **'К списку учеников'**
  String get toStudentsList;

  /// No description provided for @periodAll.
  ///
  /// In ru, this message translates to:
  /// **'Всё'**
  String get periodAll;

  /// No description provided for @periodDay.
  ///
  /// In ru, this message translates to:
  /// **'День'**
  String get periodDay;

  /// No description provided for @periodWeek.
  ///
  /// In ru, this message translates to:
  /// **'Неделя'**
  String get periodWeek;

  /// No description provided for @periodMonth.
  ///
  /// In ru, this message translates to:
  /// **'Месяц'**
  String get periodMonth;

  /// No description provided for @weekRangeSameMonth.
  ///
  /// In ru, this message translates to:
  /// **'{startDay}–{endDay} {month}'**
  String weekRangeSameMonth(String startDay, String endDay, String month);

  /// No description provided for @weekRangeCrossMonth.
  ///
  /// In ru, this message translates to:
  /// **'{start} – {end}'**
  String weekRangeCrossMonth(String start, String end);

  /// No description provided for @durationMinutes.
  ///
  /// In ru, this message translates to:
  /// **'{minutes} мин'**
  String durationMinutes(int minutes);

  /// No description provided for @durationHours.
  ///
  /// In ru, this message translates to:
  /// **'{hours} ч'**
  String durationHours(int hours);

  /// No description provided for @durationHoursMinutes.
  ///
  /// In ru, this message translates to:
  /// **'{hours} ч {minutes} мин'**
  String durationHoursMinutes(int hours, int minutes);

  /// No description provided for @lessonsCount.
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, one{{count} занятие} few{{count} занятия} many{{count} занятий} other{{count} занятия}}'**
  String lessonsCount(int count);

  /// No description provided for @paymentsCount.
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, one{{count} платёж} few{{count} платежа} many{{count} платежей} other{{count} платежа}}'**
  String paymentsCount(int count);

  /// No description provided for @gradesCount.
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, one{{count} оценка} few{{count} оценки} many{{count} оценок} other{{count} оценки}}'**
  String gradesCount(int count);

  /// No description provided for @studentsCount.
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, one{{count} ученик} few{{count} ученика} many{{count} учеников} other{{count} ученика}}'**
  String studentsCount(int count);

  /// No description provided for @entriesCount.
  ///
  /// In ru, this message translates to:
  /// **'{count, plural, one{{count} запись} few{{count} записи} many{{count} записей} other{{count} записи}}'**
  String entriesCount(int count);

  /// No description provided for @andMore.
  ///
  /// In ru, this message translates to:
  /// **'и ещё {items}'**
  String andMore(String items);

  /// No description provided for @fieldNameRequired.
  ///
  /// In ru, this message translates to:
  /// **'Укажите имя ученика'**
  String get fieldNameRequired;

  /// No description provided for @fieldNameTooLong.
  ///
  /// In ru, this message translates to:
  /// **'Не длиннее {max} символов'**
  String fieldNameTooLong(int max);

  /// No description provided for @fieldPhoneInvalid.
  ///
  /// In ru, this message translates to:
  /// **'Например, +7 900 123-45-67'**
  String get fieldPhoneInvalid;

  /// No description provided for @fieldTelegramInvalid.
  ///
  /// In ru, this message translates to:
  /// **'5–32 символа: латиница, цифры и «_»'**
  String get fieldTelegramInvalid;

  /// No description provided for @fieldIntegerRequired.
  ///
  /// In ru, this message translates to:
  /// **'Целое число'**
  String get fieldIntegerRequired;

  /// No description provided for @fieldGradeBoundOutOfRange.
  ///
  /// In ru, this message translates to:
  /// **'От 0 до {max}'**
  String fieldGradeBoundOutOfRange(int max);

  /// No description provided for @fieldGradeRangeInvalid.
  ///
  /// In ru, this message translates to:
  /// **'Минимум должен быть меньше максимума'**
  String get fieldGradeRangeInvalid;

  /// No description provided for @fieldPriceRequired.
  ///
  /// In ru, this message translates to:
  /// **'Укажите стоимость занятия'**
  String get fieldPriceRequired;

  /// No description provided for @fieldAmountRequired.
  ///
  /// In ru, this message translates to:
  /// **'Укажите сумму'**
  String get fieldAmountRequired;

  /// No description provided for @fieldMoneyFormat.
  ///
  /// In ru, this message translates to:
  /// **'Сумма в рублях, например 1500 или 1500,50'**
  String get fieldMoneyFormat;

  /// No description provided for @fieldAmountTooLarge.
  ///
  /// In ru, this message translates to:
  /// **'Слишком большая сумма'**
  String get fieldAmountTooLarge;

  /// No description provided for @fieldAmountNotPositive.
  ///
  /// In ru, this message translates to:
  /// **'Сумма должна быть больше нуля'**
  String get fieldAmountNotPositive;

  /// No description provided for @failureStudentNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Ученик не найден'**
  String get failureStudentNotFound;

  /// No description provided for @failureEnrollmentNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Предмет ученика не найден'**
  String get failureEnrollmentNotFound;

  /// No description provided for @failureSubjectNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Предмет не найден'**
  String get failureSubjectNotFound;

  /// No description provided for @failureLessonNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Занятие не найдено'**
  String get failureLessonNotFound;

  /// No description provided for @failurePaymentNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Платёж не найден'**
  String get failurePaymentNotFound;

  /// No description provided for @failurePackageNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Пакет не найден'**
  String get failurePackageNotFound;

  /// No description provided for @failureProgressEntryNotFound.
  ///
  /// In ru, this message translates to:
  /// **'Запись прогресса не найдена'**
  String get failureProgressEntryNotFound;

  /// No description provided for @failureSubjectNameTaken.
  ///
  /// In ru, this message translates to:
  /// **'Предмет «{name}» уже есть'**
  String failureSubjectNameTaken(String name);

  /// No description provided for @failureSubjectInUse.
  ///
  /// In ru, this message translates to:
  /// **'Предмет используется в направлениях учеников'**
  String get failureSubjectInUse;

  /// No description provided for @failureEnrollmentExists.
  ///
  /// In ru, this message translates to:
  /// **'У ученика уже есть направление по этому предмету'**
  String get failureEnrollmentExists;

  /// No description provided for @failurePackageBelowUsage.
  ///
  /// In ru, this message translates to:
  /// **'Из пакета уже списано занятий: {used}. Нельзя сделать в нём меньше занятий'**
  String failurePackageBelowUsage(int used);

  /// No description provided for @failureLessonDurationOutOfRange.
  ///
  /// In ru, this message translates to:
  /// **'Длительность занятия — от 5 минут до 10 часов'**
  String get failureLessonDurationOutOfRange;

  /// No description provided for @failureLessonPriceInvalid.
  ///
  /// In ru, this message translates to:
  /// **'Недопустимая стоимость занятия'**
  String get failureLessonPriceInvalid;

  /// No description provided for @failureEnrollmentArchived.
  ///
  /// In ru, this message translates to:
  /// **'Предмет в архиве. Верните его из архива, чтобы планировать занятия'**
  String get failureEnrollmentArchived;

  /// No description provided for @failureRescheduleOnlyPlanned.
  ///
  /// In ru, this message translates to:
  /// **'Перенести можно только запланированное занятие'**
  String get failureRescheduleOnlyPlanned;

  /// No description provided for @failureGradeOnlyForCompleted.
  ///
  /// In ru, this message translates to:
  /// **'Оценку можно поставить только за проведённое занятие'**
  String get failureGradeOnlyForCompleted;

  /// No description provided for @failureGradeOutOfScale.
  ///
  /// In ru, this message translates to:
  /// **'Оценка должна быть от {min} до {max}'**
  String failureGradeOutOfScale(int min, int max);

  /// No description provided for @failurePaymentAmountInvalid.
  ///
  /// In ru, this message translates to:
  /// **'Недопустимая сумма платежа'**
  String get failurePaymentAmountInvalid;

  /// No description provided for @failurePaymentDateInFuture.
  ///
  /// In ru, this message translates to:
  /// **'Дата оплаты не может быть в будущем'**
  String get failurePaymentDateInFuture;

  /// No description provided for @failureProgressEntryEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Укажите тему, оценку или заметку'**
  String get failureProgressEntryEmpty;

  /// No description provided for @failureProgressDateInFuture.
  ///
  /// In ru, this message translates to:
  /// **'Дата записи не может быть в будущем'**
  String get failureProgressDateInFuture;

  /// No description provided for @failureLessonOfOtherSubject.
  ///
  /// In ru, this message translates to:
  /// **'Занятие относится к другому предмету'**
  String get failureLessonOfOtherSubject;

  /// No description provided for @failureLessonNotPast.
  ///
  /// In ru, this message translates to:
  /// **'Запись можно привязать только к прошедшему занятию'**
  String get failureLessonNotPast;

  /// No description provided for @failureLessonHasProgressEntry.
  ///
  /// In ru, this message translates to:
  /// **'У этого занятия уже есть запись прогресса'**
  String get failureLessonHasProgressEntry;

  /// No description provided for @settingsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settingsTitle;

  /// No description provided for @settingsTheme.
  ///
  /// In ru, this message translates to:
  /// **'Тема'**
  String get settingsTheme;

  /// No description provided for @settingsThemeSystem.
  ///
  /// In ru, this message translates to:
  /// **'Как в системе'**
  String get settingsThemeSystem;

  /// No description provided for @settingsThemeLight.
  ///
  /// In ru, this message translates to:
  /// **'Светлая'**
  String get settingsThemeLight;

  /// No description provided for @settingsThemeDark.
  ///
  /// In ru, this message translates to:
  /// **'Тёмная'**
  String get settingsThemeDark;

  /// No description provided for @settingsLanguage.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageSystem.
  ///
  /// In ru, this message translates to:
  /// **'Как в системе'**
  String get settingsLanguageSystem;

  /// No description provided for @settingsDataNote.
  ///
  /// In ru, this message translates to:
  /// **'Данные хранятся только на этом устройстве'**
  String get settingsDataNote;

  /// No description provided for @balanceDebt.
  ///
  /// In ru, this message translates to:
  /// **'Долг {amount}'**
  String balanceDebt(String amount);

  /// No description provided for @balanceAdvance.
  ///
  /// In ru, this message translates to:
  /// **'Аванс {amount}'**
  String balanceAdvance(String amount);

  /// No description provided for @balanceNoDebt.
  ///
  /// In ru, this message translates to:
  /// **'Долгов нет'**
  String get balanceNoDebt;

  /// No description provided for @settingsTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settingsTooltip;

  /// No description provided for @studentsArchiveTitle.
  ///
  /// In ru, this message translates to:
  /// **'Архив учеников'**
  String get studentsArchiveTitle;

  /// No description provided for @studentsSortTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Сортировка'**
  String get studentsSortTooltip;

  /// No description provided for @studentsActiveTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Активные ученики'**
  String get studentsActiveTooltip;

  /// No description provided for @studentsArchiveTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Архив'**
  String get studentsArchiveTooltip;

  /// No description provided for @studentsAddFab.
  ///
  /// In ru, this message translates to:
  /// **'Ученик'**
  String get studentsAddFab;

  /// No description provided for @studentsNoMatchesTitle.
  ///
  /// In ru, this message translates to:
  /// **'Никого не нашли'**
  String get studentsNoMatchesTitle;

  /// No description provided for @studentsNoMatchesMessage.
  ///
  /// In ru, this message translates to:
  /// **'Измените запрос или сбросьте фильтры'**
  String get studentsNoMatchesMessage;

  /// No description provided for @studentsResetFilters.
  ///
  /// In ru, this message translates to:
  /// **'Сбросить фильтры'**
  String get studentsResetFilters;

  /// No description provided for @studentsArchiveEmptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Архив пуст'**
  String get studentsArchiveEmptyTitle;

  /// No description provided for @studentsArchiveEmptyMessage.
  ///
  /// In ru, this message translates to:
  /// **'Сюда попадают ученики, с которыми вы больше не занимаетесь'**
  String get studentsArchiveEmptyMessage;

  /// No description provided for @studentsEmptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Учеников пока нет'**
  String get studentsEmptyTitle;

  /// No description provided for @studentsEmptyMessage.
  ///
  /// In ru, this message translates to:
  /// **'Добавьте первого ученика, чтобы вести занятия и оплаты'**
  String get studentsEmptyMessage;

  /// No description provided for @studentSortName.
  ///
  /// In ru, this message translates to:
  /// **'По имени'**
  String get studentSortName;

  /// No description provided for @studentSortDebt.
  ///
  /// In ru, this message translates to:
  /// **'По долгу'**
  String get studentSortDebt;

  /// No description provided for @studentsSearchHint.
  ///
  /// In ru, this message translates to:
  /// **'Имя, телефон или Telegram'**
  String get studentsSearchHint;

  /// No description provided for @studentsDebtorsFilter.
  ///
  /// In ru, this message translates to:
  /// **'Должники'**
  String get studentsDebtorsFilter;

  /// No description provided for @studentNoSubjects.
  ///
  /// In ru, this message translates to:
  /// **'Нет предметов'**
  String get studentNoSubjects;

  /// No description provided for @notesSaved.
  ///
  /// In ru, this message translates to:
  /// **'Заметка сохранена'**
  String get notesSaved;

  /// No description provided for @notesAboutStudent.
  ///
  /// In ru, this message translates to:
  /// **'Об ученике'**
  String get notesAboutStudent;

  /// No description provided for @notesStudentNoteTitle.
  ///
  /// In ru, this message translates to:
  /// **'Заметка об ученике'**
  String get notesStudentNoteTitle;

  /// No description provided for @notesSubjectHint.
  ///
  /// In ru, this message translates to:
  /// **'Цели, слабые места, программа'**
  String get notesSubjectHint;

  /// No description provided for @notesEditTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Редактировать заметку'**
  String get notesEditTooltip;

  /// No description provided for @notesEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Заметок пока нет'**
  String get notesEmpty;

  /// No description provided for @gradeScaleCustom.
  ///
  /// In ru, this message translates to:
  /// **'Своя'**
  String get gradeScaleCustom;

  /// No description provided for @gradeScaleFrom.
  ///
  /// In ru, this message translates to:
  /// **'От'**
  String get gradeScaleFrom;

  /// No description provided for @gradeScaleTo.
  ///
  /// In ru, this message translates to:
  /// **'До'**
  String get gradeScaleTo;

  /// No description provided for @gradeScaleHint.
  ///
  /// In ru, this message translates to:
  /// **'По этой шкале ставятся оценки за занятия'**
  String get gradeScaleHint;

  /// No description provided for @gradeScaleTitle.
  ///
  /// In ru, this message translates to:
  /// **'Шкала оценок'**
  String get gradeScaleTitle;

  /// No description provided for @studentLessonsEmptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Занятий пока нет'**
  String get studentLessonsEmptyTitle;

  /// No description provided for @studentLessonsEmptyMessage.
  ///
  /// In ru, this message translates to:
  /// **'Запланируйте первое занятие с учеником'**
  String get studentLessonsEmptyMessage;

  /// No description provided for @planLesson.
  ///
  /// In ru, this message translates to:
  /// **'Запланировать занятие'**
  String get planLesson;

  /// No description provided for @studentPaymentsEmptyTitle.
  ///
  /// In ru, this message translates to:
  /// **'Оплат пока нет'**
  String get studentPaymentsEmptyTitle;

  /// No description provided for @studentPaymentsEmptyMessage.
  ///
  /// In ru, this message translates to:
  /// **'Здесь появятся платежи, пакеты и расчёт долга'**
  String get studentPaymentsEmptyMessage;

  /// No description provided for @addPayment.
  ///
  /// In ru, this message translates to:
  /// **'Добавить платёж'**
  String get addPayment;

  /// No description provided for @paymentShort.
  ///
  /// In ru, this message translates to:
  /// **'Платёж'**
  String get paymentShort;

  /// No description provided for @remind.
  ///
  /// In ru, this message translates to:
  /// **'Напомнить'**
  String get remind;

  /// No description provided for @packagesSection.
  ///
  /// In ru, this message translates to:
  /// **'Пакеты'**
  String get packagesSection;

  /// No description provided for @paymentsSection.
  ///
  /// In ru, this message translates to:
  /// **'Платежи'**
  String get paymentsSection;

  /// No description provided for @noPaymentsYet.
  ///
  /// In ru, this message translates to:
  /// **'Платежей пока нет'**
  String get noPaymentsYet;

  /// No description provided for @balanceLessonsOutsidePackages.
  ///
  /// In ru, this message translates to:
  /// **'Занятия вне пакетов'**
  String get balanceLessonsOutsidePackages;

  /// No description provided for @balancePaid.
  ///
  /// In ru, this message translates to:
  /// **'Оплачено'**
  String get balancePaid;

  /// No description provided for @balanceTitle.
  ///
  /// In ru, this message translates to:
  /// **'Баланс'**
  String get balanceTitle;

  /// No description provided for @packageUsedUp.
  ///
  /// In ru, this message translates to:
  /// **'Использован полностью'**
  String get packageUsedUp;

  /// No description provided for @packageRemaining.
  ///
  /// In ru, this message translates to:
  /// **'Осталось {remaining} из {total}'**
  String packageRemaining(int remaining, int total);

  /// No description provided for @packageUsageSince.
  ///
  /// In ru, this message translates to:
  /// **'{usage} · от {date}'**
  String packageUsageSince(String usage, String date);

  /// No description provided for @studentArchivedBanner.
  ///
  /// In ru, this message translates to:
  /// **'Ученик в архиве'**
  String get studentArchivedBanner;

  /// No description provided for @restore.
  ///
  /// In ru, this message translates to:
  /// **'Вернуть'**
  String get restore;

  /// No description provided for @addContacts.
  ///
  /// In ru, this message translates to:
  /// **'Добавить контакты'**
  String get addContacts;

  /// No description provided for @balanceChargedPaid.
  ///
  /// In ru, this message translates to:
  /// **'Начислено {charged} · оплачено {paid}'**
  String balanceChargedPaid(String charged, String paid);

  /// No description provided for @subjectsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Предметы'**
  String get subjectsTitle;

  /// No description provided for @subjectsEmptyHint.
  ///
  /// In ru, this message translates to:
  /// **'Добавьте предмет и стоимость занятия — они понадобятся для занятий и оплат'**
  String get subjectsEmptyHint;

  /// No description provided for @subjectArchived.
  ///
  /// In ru, this message translates to:
  /// **'{subject} · в архиве'**
  String subjectArchived(String subject);

  /// No description provided for @rateForDuration.
  ///
  /// In ru, this message translates to:
  /// **'{price} за {duration}'**
  String rateForDuration(String price, String duration);

  /// No description provided for @progressNoSubjectsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Нет предметов'**
  String get progressNoSubjectsTitle;

  /// No description provided for @progressNoSubjectsMessage.
  ///
  /// In ru, this message translates to:
  /// **'Добавьте предмет, чтобы отслеживать прогресс'**
  String get progressNoSubjectsMessage;

  /// No description provided for @studentEditTitle.
  ///
  /// In ru, this message translates to:
  /// **'Редактирование'**
  String get studentEditTitle;

  /// No description provided for @studentNewTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новый ученик'**
  String get studentNewTitle;

  /// No description provided for @fieldFullName.
  ///
  /// In ru, this message translates to:
  /// **'Имя и фамилия *'**
  String get fieldFullName;

  /// No description provided for @fieldPhone.
  ///
  /// In ru, this message translates to:
  /// **'Телефон'**
  String get fieldPhone;

  /// No description provided for @fieldTelegramHint.
  ///
  /// In ru, this message translates to:
  /// **'@username или ссылка t.me'**
  String get fieldTelegramHint;

  /// No description provided for @studentNoteHint.
  ///
  /// In ru, this message translates to:
  /// **'Цели, особенности, договорённости'**
  String get studentNoteHint;

  /// No description provided for @enrollmentNewTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новый предмет'**
  String get enrollmentNewTitle;

  /// No description provided for @enrollmentTitle.
  ///
  /// In ru, this message translates to:
  /// **'Предмет ученика'**
  String get enrollmentTitle;

  /// No description provided for @subjectNameLabel.
  ///
  /// In ru, this message translates to:
  /// **'Название'**
  String get subjectNameLabel;

  /// No description provided for @enterName.
  ///
  /// In ru, this message translates to:
  /// **'Введите название'**
  String get enterName;

  /// No description provided for @enrollmentPrice.
  ///
  /// In ru, this message translates to:
  /// **'Стоимость занятия *'**
  String get enrollmentPrice;

  /// No description provided for @enrollmentPriceHelper.
  ///
  /// In ru, this message translates to:
  /// **'Подставляется в новые занятия. Прошлые занятия сохраняют свою стоимость'**
  String get enrollmentPriceHelper;

  /// No description provided for @defaultDuration.
  ///
  /// In ru, this message translates to:
  /// **'Длительность по умолчанию'**
  String get defaultDuration;

  /// No description provided for @enrollmentNote.
  ///
  /// In ru, this message translates to:
  /// **'Заметка по предмету'**
  String get enrollmentNote;

  /// No description provided for @archivedSwitch.
  ///
  /// In ru, this message translates to:
  /// **'В архиве'**
  String get archivedSwitch;

  /// No description provided for @enrollmentArchivedHint.
  ///
  /// In ru, this message translates to:
  /// **'Предмет скрыт из активных, история сохраняется'**
  String get enrollmentArchivedHint;

  /// No description provided for @addSubject.
  ///
  /// In ru, this message translates to:
  /// **'Добавить предмет'**
  String get addSubject;

  /// No description provided for @addSubjectHint.
  ///
  /// In ru, this message translates to:
  /// **'Добавьте предмет, который вы ведёте'**
  String get addSubjectHint;

  /// No description provided for @newSubjectOption.
  ///
  /// In ru, this message translates to:
  /// **'Новый предмет…'**
  String get newSubjectOption;

  /// No description provided for @tabLessons.
  ///
  /// In ru, this message translates to:
  /// **'Занятия'**
  String get tabLessons;

  /// No description provided for @tabPayments.
  ///
  /// In ru, this message translates to:
  /// **'Оплаты'**
  String get tabPayments;

  /// No description provided for @tabProgress.
  ///
  /// In ru, this message translates to:
  /// **'Прогресс'**
  String get tabProgress;

  /// No description provided for @tabNotes.
  ///
  /// In ru, this message translates to:
  /// **'Заметки'**
  String get tabNotes;

  /// No description provided for @studentMovedToArchive.
  ///
  /// In ru, this message translates to:
  /// **'Ученик перемещён в архив'**
  String get studentMovedToArchive;

  /// No description provided for @deleteStudentTitle.
  ///
  /// In ru, this message translates to:
  /// **'Удалить ученика?'**
  String get deleteStudentTitle;

  /// No description provided for @deleteStudentMessage.
  ///
  /// In ru, this message translates to:
  /// **'Будут удалены все занятия, оплаты и прогресс ученика. Это действие нельзя отменить.\n\nЕсли вы просто больше не занимаетесь, отправьте ученика в архив — история сохранится.'**
  String get deleteStudentMessage;

  /// No description provided for @studentDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Ученик удалён'**
  String get studentDeleted;

  /// No description provided for @restoreFromArchive.
  ///
  /// In ru, this message translates to:
  /// **'Вернуть из архива'**
  String get restoreFromArchive;

  /// No description provided for @toArchive.
  ///
  /// In ru, this message translates to:
  /// **'В архив'**
  String get toArchive;

  /// No description provided for @statusPlanned.
  ///
  /// In ru, this message translates to:
  /// **'Запланировано'**
  String get statusPlanned;

  /// No description provided for @statusCompleted.
  ///
  /// In ru, this message translates to:
  /// **'Проведено'**
  String get statusCompleted;

  /// No description provided for @statusCancelledByStudent.
  ///
  /// In ru, this message translates to:
  /// **'Отменено учеником'**
  String get statusCancelledByStudent;

  /// No description provided for @statusCancelledByTutor.
  ///
  /// In ru, this message translates to:
  /// **'Отменено мной'**
  String get statusCancelledByTutor;

  /// No description provided for @statusNoShow.
  ///
  /// In ru, this message translates to:
  /// **'Пропуск'**
  String get statusNoShow;

  /// No description provided for @lessonsFab.
  ///
  /// In ru, this message translates to:
  /// **'Занятие'**
  String get lessonsFab;

  /// No description provided for @noLessons.
  ///
  /// In ru, this message translates to:
  /// **'Занятий нет'**
  String get noLessons;

  /// No description provided for @noLessonsThisWeek.
  ///
  /// In ru, this message translates to:
  /// **'На этой неделе занятий нет'**
  String get noLessonsThisWeek;

  /// No description provided for @todayWithDate.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня, {date}'**
  String todayWithDate(String date);

  /// No description provided for @noLessonsMessage.
  ///
  /// In ru, this message translates to:
  /// **'Запланируйте занятие или выберите другой период'**
  String get noLessonsMessage;

  /// No description provided for @monthDaySemantics.
  ///
  /// In ru, this message translates to:
  /// **'{day}, занятий: {count}'**
  String monthDaySemantics(String day, int count);

  /// No description provided for @markedAs.
  ///
  /// In ru, this message translates to:
  /// **'Отмечено: {status}'**
  String markedAs(String status);

  /// No description provided for @billableHint.
  ///
  /// In ru, this message translates to:
  /// **'Оплачивается: из пакета или в долг'**
  String get billableHint;

  /// No description provided for @notBillable.
  ///
  /// In ru, this message translates to:
  /// **'Не оплачивается'**
  String get notBillable;

  /// No description provided for @lessonTopic.
  ///
  /// In ru, this message translates to:
  /// **'Тема занятия'**
  String get lessonTopic;

  /// No description provided for @gradeWithScale.
  ///
  /// In ru, this message translates to:
  /// **'Оценка ({min}–{max})'**
  String gradeWithScale(int min, int max);

  /// No description provided for @comment.
  ///
  /// In ru, this message translates to:
  /// **'Комментарий'**
  String get comment;

  /// No description provided for @commentHint.
  ///
  /// In ru, this message translates to:
  /// **'Что получилось, над чем поработать'**
  String get commentHint;

  /// No description provided for @rescheduledTo.
  ///
  /// In ru, this message translates to:
  /// **'Перенесено на {dateTime}'**
  String rescheduledTo(String dateTime);

  /// No description provided for @lessonPlannedAgain.
  ///
  /// In ru, this message translates to:
  /// **'Занятие снова запланировано'**
  String get lessonPlannedAgain;

  /// No description provided for @deleteLessonTitle.
  ///
  /// In ru, this message translates to:
  /// **'Удалить занятие?'**
  String get deleteLessonTitle;

  /// No description provided for @deleteLessonMessage.
  ///
  /// In ru, this message translates to:
  /// **'Занятие, его оценка и начисление будут удалены. Если занятие было списано из пакета, оно вернётся в пакет.'**
  String get deleteLessonMessage;

  /// No description provided for @lessonDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Занятие удалено'**
  String get lessonDeleted;

  /// No description provided for @cancelByStudent.
  ///
  /// In ru, this message translates to:
  /// **'Отменил ученик'**
  String get cancelByStudent;

  /// No description provided for @cancelNoShow.
  ///
  /// In ru, this message translates to:
  /// **'Ученик не пришёл'**
  String get cancelNoShow;

  /// No description provided for @cancelByTutor.
  ///
  /// In ru, this message translates to:
  /// **'Отменил я'**
  String get cancelByTutor;

  /// No description provided for @billable.
  ///
  /// In ru, this message translates to:
  /// **'Оплачивается'**
  String get billable;

  /// No description provided for @lessonTitle.
  ///
  /// In ru, this message translates to:
  /// **'Занятие'**
  String get lessonTitle;

  /// No description provided for @lessonNewTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новое занятие'**
  String get lessonNewTitle;

  /// No description provided for @lessonNeedsStudentMessage.
  ///
  /// In ru, this message translates to:
  /// **'Занятие назначается ученику по одному из его предметов'**
  String get lessonNeedsStudentMessage;

  /// No description provided for @deleteLessonTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Удалить занятие'**
  String get deleteLessonTooltip;

  /// No description provided for @studentAndSubject.
  ///
  /// In ru, this message translates to:
  /// **'Ученик и предмет'**
  String get studentAndSubject;

  /// No description provided for @priceRequired.
  ///
  /// In ru, this message translates to:
  /// **'Стоимость *'**
  String get priceRequired;

  /// No description provided for @statusLabel.
  ///
  /// In ru, this message translates to:
  /// **'Статус'**
  String get statusLabel;

  /// No description provided for @lessonNote.
  ///
  /// In ru, this message translates to:
  /// **'Заметка к занятию'**
  String get lessonNote;

  /// No description provided for @lessonNoteHint.
  ///
  /// In ru, this message translates to:
  /// **'Домашнее задание, материалы'**
  String get lessonNoteHint;

  /// No description provided for @createLesson.
  ///
  /// In ru, this message translates to:
  /// **'Создать занятие'**
  String get createLesson;

  /// No description provided for @paidFromPackage.
  ///
  /// In ru, this message translates to:
  /// **'Оплачено из пакета'**
  String get paidFromPackage;

  /// No description provided for @billableFormHint.
  ///
  /// In ru, this message translates to:
  /// **'Оплачивается: из пакета, если он есть, иначе в долг'**
  String get billableFormHint;

  /// No description provided for @selectStudentFirst.
  ///
  /// In ru, this message translates to:
  /// **'Сначала выберите ученика'**
  String get selectStudentFirst;

  /// No description provided for @studentHasNoSubjects.
  ///
  /// In ru, this message translates to:
  /// **'У ученика нет предметов — добавьте их в карточке ученика'**
  String get studentHasNoSubjects;

  /// No description provided for @needsMarking.
  ///
  /// In ru, this message translates to:
  /// **'Нужно отметить'**
  String get needsMarking;

  /// No description provided for @actionCancelled.
  ///
  /// In ru, this message translates to:
  /// **'Отменено'**
  String get actionCancelled;

  /// No description provided for @actionReschedule.
  ///
  /// In ru, this message translates to:
  /// **'Перенести'**
  String get actionReschedule;

  /// No description provided for @lessonActionsTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Действия с занятием'**
  String get lessonActionsTooltip;

  /// No description provided for @markOutcome.
  ///
  /// In ru, this message translates to:
  /// **'Отметить итог…'**
  String get markOutcome;

  /// No description provided for @editOutcome.
  ///
  /// In ru, this message translates to:
  /// **'Изменить итог…'**
  String get editOutcome;

  /// No description provided for @returnToPlanned.
  ///
  /// In ru, this message translates to:
  /// **'Вернуть в запланированные'**
  String get returnToPlanned;

  /// No description provided for @methodCardTransfer.
  ///
  /// In ru, this message translates to:
  /// **'Перевод на карту'**
  String get methodCardTransfer;

  /// No description provided for @methodCash.
  ///
  /// In ru, this message translates to:
  /// **'Наличные'**
  String get methodCash;

  /// No description provided for @methodOther.
  ///
  /// In ru, this message translates to:
  /// **'Другое'**
  String get methodOther;

  /// No description provided for @allStudents.
  ///
  /// In ru, this message translates to:
  /// **'Все ученики'**
  String get allStudents;

  /// No description provided for @noPaymentsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Платежей нет'**
  String get noPaymentsTitle;

  /// No description provided for @noPaymentsMessage.
  ///
  /// In ru, this message translates to:
  /// **'Измените период или ученика либо добавьте платёж'**
  String get noPaymentsMessage;

  /// No description provided for @paymentsTotal.
  ///
  /// In ru, this message translates to:
  /// **'Итого {total} · {payments}'**
  String paymentsTotal(String total, String payments);

  /// No description provided for @studentHasNoDebt.
  ///
  /// In ru, this message translates to:
  /// **'У ученика нет долга'**
  String get studentHasNoDebt;

  /// No description provided for @reminderCopied.
  ///
  /// In ru, this message translates to:
  /// **'Текст скопирован — вставьте его в мессенджер'**
  String get reminderCopied;

  /// No description provided for @reminderTitle.
  ///
  /// In ru, this message translates to:
  /// **'Напоминание об оплате'**
  String get reminderTitle;

  /// No description provided for @reminderEditHint.
  ///
  /// In ru, this message translates to:
  /// **'Текст можно отредактировать перед копированием'**
  String get reminderEditHint;

  /// No description provided for @debtReminderText.
  ///
  /// In ru, this message translates to:
  /// **'Здравствуйте, {name}!\n\nНапоминаю об оплате занятий: к оплате {amount}.\nОплатить можно переводом на карту. Если уже оплатили — спасибо, просто сообщите мне.'**
  String debtReminderText(String name, String amount);

  /// No description provided for @incomeEmpty.
  ///
  /// In ru, this message translates to:
  /// **'За этот период нет оплат и начислений'**
  String get incomeEmpty;

  /// No description provided for @byStudents.
  ///
  /// In ru, this message translates to:
  /// **'По ученикам'**
  String get byStudents;

  /// No description provided for @incomeReceived.
  ///
  /// In ru, this message translates to:
  /// **'Получено'**
  String get incomeReceived;

  /// No description provided for @incomeCharged.
  ///
  /// In ru, this message translates to:
  /// **'Начислено'**
  String get incomeCharged;

  /// No description provided for @incomeBreakdown.
  ///
  /// In ru, this message translates to:
  /// **'Занятия {lessons} · пакеты {packages}'**
  String incomeBreakdown(String lessons, String packages);

  /// No description provided for @incomeCompleted.
  ///
  /// In ru, this message translates to:
  /// **'Проведено {lessons}'**
  String incomeCompleted(String lessons);

  /// No description provided for @incomeCompletedWithDuration.
  ///
  /// In ru, this message translates to:
  /// **'Проведено {lessons} · {duration}'**
  String incomeCompletedWithDuration(String lessons, String duration);

  /// No description provided for @incomeExplanation.
  ///
  /// In ru, this message translates to:
  /// **'«Получено» — деньги, пришедшие за период. «Начислено» — стоимость оплачиваемых занятий и пакетов за период.'**
  String get incomeExplanation;

  /// No description provided for @studentIncomeSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Начислено {charged} · {lessons}'**
  String studentIncomeSubtitle(String charged, String lessons);

  /// No description provided for @paymentNewTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новый платёж'**
  String get paymentNewTitle;

  /// No description provided for @paymentSaved.
  ///
  /// In ru, this message translates to:
  /// **'Платёж {amount} сохранён'**
  String paymentSaved(String amount);

  /// No description provided for @deletePaymentTitle.
  ///
  /// In ru, this message translates to:
  /// **'Удалить платёж?'**
  String get deletePaymentTitle;

  /// No description provided for @deletePaymentMessage.
  ///
  /// In ru, this message translates to:
  /// **'Долг ученика увеличится на сумму платежа.'**
  String get deletePaymentMessage;

  /// No description provided for @paymentDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Платёж удалён'**
  String get paymentDeleted;

  /// No description provided for @deletePaymentTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Удалить платёж'**
  String get deletePaymentTooltip;

  /// No description provided for @amountRequiredLabel.
  ///
  /// In ru, this message translates to:
  /// **'Сумма *'**
  String get amountRequiredLabel;

  /// No description provided for @paymentDate.
  ///
  /// In ru, this message translates to:
  /// **'Дата оплаты'**
  String get paymentDate;

  /// No description provided for @paymentMethod.
  ///
  /// In ru, this message translates to:
  /// **'Способ'**
  String get paymentMethod;

  /// No description provided for @paymentCommentHint.
  ///
  /// In ru, this message translates to:
  /// **'Например, за октябрь'**
  String get paymentCommentHint;

  /// No description provided for @payWholeDebt.
  ///
  /// In ru, this message translates to:
  /// **'Вся сумма долга'**
  String get payWholeDebt;

  /// No description provided for @noDebtorsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Должников нет'**
  String get noDebtorsTitle;

  /// No description provided for @noDebtorsMessage.
  ///
  /// In ru, this message translates to:
  /// **'Все ученики рассчитались за занятия'**
  String get noDebtorsMessage;

  /// No description provided for @totalDebt.
  ///
  /// In ru, this message translates to:
  /// **'Общий долг'**
  String get totalDebt;

  /// No description provided for @debtorsWithAdvances.
  ///
  /// In ru, this message translates to:
  /// **'{students} · авансы {amount}'**
  String debtorsWithAdvances(String students, String amount);

  /// No description provided for @lastPaymentNone.
  ///
  /// In ru, this message translates to:
  /// **'Оплат ещё не было'**
  String get lastPaymentNone;

  /// No description provided for @lastPayment.
  ///
  /// In ru, this message translates to:
  /// **'Последняя оплата {date}'**
  String lastPayment(String date);

  /// No description provided for @recordPayment.
  ///
  /// In ru, this message translates to:
  /// **'Внести оплату'**
  String get recordPayment;

  /// No description provided for @financeTabDebtors.
  ///
  /// In ru, this message translates to:
  /// **'Должники'**
  String get financeTabDebtors;

  /// No description provided for @financeTabIncome.
  ///
  /// In ru, this message translates to:
  /// **'Доходы'**
  String get financeTabIncome;

  /// No description provided for @chartEmpty.
  ///
  /// In ru, this message translates to:
  /// **'График появится после первой оценки'**
  String get chartEmpty;

  /// No description provided for @chartSemantics.
  ///
  /// In ru, this message translates to:
  /// **'График оценок: {grades}, средний балл {average} из {max}'**
  String chartSemantics(String grades, String average, int max);

  /// No description provided for @chartAverage.
  ///
  /// In ru, this message translates to:
  /// **'среднее {average}'**
  String chartAverage(String average);

  /// No description provided for @chartNoTopic.
  ///
  /// In ru, this message translates to:
  /// **'без темы'**
  String get chartNoTopic;

  /// No description provided for @gradeRange.
  ///
  /// In ru, this message translates to:
  /// **'От {min} до {max}'**
  String gradeRange(int min, int max);

  /// No description provided for @progressDetails.
  ///
  /// In ru, this message translates to:
  /// **'Подробнее'**
  String get progressDetails;

  /// No description provided for @noGradesYet.
  ///
  /// In ru, this message translates to:
  /// **'Оценок пока нет'**
  String get noGradesYet;

  /// No description provided for @averageSummary.
  ///
  /// In ru, this message translates to:
  /// **'Средний балл {average} из {max} · {grades}'**
  String averageSummary(String average, int max, String grades);

  /// No description provided for @toReview.
  ///
  /// In ru, this message translates to:
  /// **'Повторить: {topics}'**
  String toReview(String topics);

  /// No description provided for @trendUp.
  ///
  /// In ru, this message translates to:
  /// **'Растёт'**
  String get trendUp;

  /// No description provided for @trendDown.
  ///
  /// In ru, this message translates to:
  /// **'Снижается'**
  String get trendDown;

  /// No description provided for @trendStable.
  ///
  /// In ru, this message translates to:
  /// **'Стабильно'**
  String get trendStable;

  /// No description provided for @masteryMastered.
  ///
  /// In ru, this message translates to:
  /// **'Освоено'**
  String get masteryMastered;

  /// No description provided for @masteryGood.
  ///
  /// In ru, this message translates to:
  /// **'Хорошо'**
  String get masteryGood;

  /// No description provided for @masteryReview.
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get masteryReview;

  /// No description provided for @masteryWeak.
  ///
  /// In ru, this message translates to:
  /// **'Слабо'**
  String get masteryWeak;

  /// No description provided for @progressEntryFab.
  ///
  /// In ru, this message translates to:
  /// **'Запись'**
  String get progressEntryFab;

  /// No description provided for @goalsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Цели и слабые места'**
  String get goalsTitle;

  /// No description provided for @sectionTopics.
  ///
  /// In ru, this message translates to:
  /// **'Темы'**
  String get sectionTopics;

  /// No description provided for @sectionTimeline.
  ///
  /// In ru, this message translates to:
  /// **'Хронология'**
  String get sectionTimeline;

  /// No description provided for @topicsEmptyHint.
  ///
  /// In ru, this message translates to:
  /// **'Темы появятся, когда вы укажете их в занятиях или записях прогресса'**
  String get topicsEmptyHint;

  /// No description provided for @topicGradesAverage.
  ///
  /// In ru, this message translates to:
  /// **'{grades}, в среднем {average}'**
  String topicGradesAverage(String grades, String average);

  /// No description provided for @timelineEmptyHint.
  ///
  /// In ru, this message translates to:
  /// **'Здесь появятся проведённые занятия и записи прогресса'**
  String get timelineEmptyHint;

  /// No description provided for @outsideLesson.
  ///
  /// In ru, this message translates to:
  /// **'вне занятия'**
  String get outsideLesson;

  /// No description provided for @averageGrade.
  ///
  /// In ru, this message translates to:
  /// **'Средний балл'**
  String get averageGrade;

  /// No description provided for @averageOutOf.
  ///
  /// In ru, this message translates to:
  /// **'{average} из {max}'**
  String averageOutOf(String average, int max);

  /// No description provided for @gradesWithScale.
  ///
  /// In ru, this message translates to:
  /// **'{grades} · шкала {min}–{max}'**
  String gradesWithScale(String grades, int min, int max);

  /// No description provided for @progressEntryTitle.
  ///
  /// In ru, this message translates to:
  /// **'Запись прогресса'**
  String get progressEntryTitle;

  /// No description provided for @progressEntryNewTitle.
  ///
  /// In ru, this message translates to:
  /// **'Новая запись'**
  String get progressEntryNewTitle;

  /// No description provided for @entrySaved.
  ///
  /// In ru, this message translates to:
  /// **'Запись сохранена'**
  String get entrySaved;

  /// No description provided for @deleteEntryTitle.
  ///
  /// In ru, this message translates to:
  /// **'Удалить запись?'**
  String get deleteEntryTitle;

  /// No description provided for @deleteEntryMessage.
  ///
  /// In ru, this message translates to:
  /// **'Оценка и заметка будут удалены. Само занятие останется.'**
  String get deleteEntryMessage;

  /// No description provided for @entryDeleted.
  ///
  /// In ru, this message translates to:
  /// **'Запись удалена'**
  String get entryDeleted;

  /// No description provided for @deleteEntryTooltip.
  ///
  /// In ru, this message translates to:
  /// **'Удалить запись'**
  String get deleteEntryTooltip;

  /// No description provided for @linkLessonHelper.
  ///
  /// In ru, this message translates to:
  /// **'Привяжите запись к занятию или оставьте отдельной (например, контрольная)'**
  String get linkLessonHelper;

  /// No description provided for @noLessonLink.
  ///
  /// In ru, this message translates to:
  /// **'Без привязки к занятию'**
  String get noLessonLink;

  /// No description provided for @lessonDateHelper.
  ///
  /// In ru, this message translates to:
  /// **'Дата занятия'**
  String get lessonDateHelper;

  /// No description provided for @topicSavedToLesson.
  ///
  /// In ru, this message translates to:
  /// **'Тема сохранится и в занятии'**
  String get topicSavedToLesson;

  /// No description provided for @gradeOnlyCompletedHint.
  ///
  /// In ru, this message translates to:
  /// **'Оценка ставится только за проведённое занятие'**
  String get gradeOnlyCompletedHint;

  /// No description provided for @addEntry.
  ///
  /// In ru, this message translates to:
  /// **'Добавить запись'**
  String get addEntry;

  /// No description provided for @unmarkedMore.
  ///
  /// In ru, this message translates to:
  /// **'и ещё {lessons} — после отметки этих они появятся здесь'**
  String unmarkedMore(String lessons);

  /// No description provided for @summaryTitle.
  ///
  /// In ru, this message translates to:
  /// **'Сводка'**
  String get summaryTitle;

  /// No description provided for @activeStudents.
  ///
  /// In ru, this message translates to:
  /// **'Активных учеников'**
  String get activeStudents;

  /// No description provided for @receivedInMonth.
  ///
  /// In ru, this message translates to:
  /// **'Получено · {month}'**
  String receivedInMonth(String month);

  /// No description provided for @monthCaption.
  ///
  /// In ru, this message translates to:
  /// **'начислено {charged} · проведено {completed}'**
  String monthCaption(String charged, int completed);

  /// No description provided for @upcomingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ближайшие занятия'**
  String get upcomingTitle;

  /// No description provided for @noMoreLessonsToday.
  ///
  /// In ru, this message translates to:
  /// **'На сегодня больше занятий нет'**
  String get noMoreLessonsToday;

  /// No description provided for @noLessonsNextWeek.
  ///
  /// In ru, this message translates to:
  /// **'На ближайшую неделю занятий нет'**
  String get noLessonsNextWeek;

  /// No description provided for @planShort.
  ///
  /// In ru, this message translates to:
  /// **'Запланировать'**
  String get planShort;

  /// No description provided for @allDebtors.
  ///
  /// In ru, this message translates to:
  /// **'Все должники'**
  String get allDebtors;

  /// No description provided for @noDebtsHint.
  ///
  /// In ru, this message translates to:
  /// **'Долгов нет — все ученики рассчитались'**
  String get noDebtsHint;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

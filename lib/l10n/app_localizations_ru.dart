// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Репетитор';

  @override
  String get navHome => 'Главная';

  @override
  String get navSchedule => 'Расписание';

  @override
  String get navFinance => 'Финансы';

  @override
  String get navStudents => 'Ученики';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageEnglish => 'English';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonSave => 'Сохранить';

  @override
  String get commonDelete => 'Удалить';

  @override
  String get commonAdd => 'Добавить';

  @override
  String get commonRetry => 'Повторить';

  @override
  String get commonClear => 'Очистить';

  @override
  String get commonEdit => 'Редактировать';

  @override
  String get commonMore => 'Ещё';

  @override
  String get commonBack => 'Назад';

  @override
  String get commonForward => 'Вперёд';

  @override
  String get commonToday => 'Сегодня';

  @override
  String get commonTomorrow => 'Завтра';

  @override
  String commonCopiedValue(String value) {
    return 'Скопировано: $value';
  }

  @override
  String get commonCopyTooltip => 'Скопировать';

  @override
  String get commonNote => 'Заметка';

  @override
  String get commonTopic => 'Тема';

  @override
  String get commonDate => 'Дата';

  @override
  String get commonTime => 'Время';

  @override
  String get commonStudent => 'Ученик';

  @override
  String get commonStudentRequired => 'Ученик *';

  @override
  String get commonSubject => 'Предмет';

  @override
  String get commonSubjectRequired => 'Предмет *';

  @override
  String get commonDuration => 'Длительность';

  @override
  String get commonPackage => 'Пакет';

  @override
  String get commonNoTopic => 'Тема не указана';

  @override
  String get commonNotFoundMaybeDeleted => 'Возможно, данные удалили';

  @override
  String get commonGrade => 'Оценка';

  @override
  String get commonNoGrade => 'Без оценки';

  @override
  String get commonSelectStudent => 'Выберите ученика';

  @override
  String get commonSelectSubject => 'Выберите предмет';

  @override
  String get commonAddStudentFirst => 'Сначала добавьте ученика';

  @override
  String get commonAddStudent => 'Добавить ученика';

  @override
  String get commonLoading => 'Загрузка…';

  @override
  String get leaveWithoutSavingTitle => 'Выйти без сохранения?';

  @override
  String get leaveWithoutSavingMessage => 'Внесённые изменения будут потеряны.';

  @override
  String get leaveAction => 'Выйти';

  @override
  String get loadErrorTitle => 'Не удалось загрузить данные';

  @override
  String get errorUnexpected => 'Что-то пошло не так. Попробуйте ещё раз.';

  @override
  String get errorWidgetTitle => 'Не удалось показать этот блок';

  @override
  String get notFoundTitle => 'Страница не найдена';

  @override
  String get toStudentsList => 'К списку учеников';

  @override
  String get periodAll => 'Всё';

  @override
  String get periodDay => 'День';

  @override
  String get periodWeek => 'Неделя';

  @override
  String get periodMonth => 'Месяц';

  @override
  String weekRangeSameMonth(String startDay, String endDay, String month) {
    return '$startDay–$endDay $month';
  }

  @override
  String weekRangeCrossMonth(String start, String end) {
    return '$start – $end';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String durationHours(int hours) {
    return '$hours ч';
  }

  @override
  String durationHoursMinutes(int hours, int minutes) {
    return '$hours ч $minutes мин';
  }

  @override
  String lessonsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count занятия',
      many: '$count занятий',
      few: '$count занятия',
      one: '$count занятие',
    );
    return '$_temp0';
  }

  @override
  String paymentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count платежа',
      many: '$count платежей',
      few: '$count платежа',
      one: '$count платёж',
    );
    return '$_temp0';
  }

  @override
  String gradesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count оценки',
      many: '$count оценок',
      few: '$count оценки',
      one: '$count оценка',
    );
    return '$_temp0';
  }

  @override
  String studentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ученика',
      many: '$count учеников',
      few: '$count ученика',
      one: '$count ученик',
    );
    return '$_temp0';
  }

  @override
  String entriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записи',
      many: '$count записей',
      few: '$count записи',
      one: '$count запись',
    );
    return '$_temp0';
  }

  @override
  String andMore(String items) {
    return 'и ещё $items';
  }

  @override
  String get fieldNameRequired => 'Укажите имя ученика';

  @override
  String fieldNameTooLong(int max) {
    return 'Не длиннее $max символов';
  }

  @override
  String get fieldPhoneInvalid => 'Например, +7 900 123-45-67';

  @override
  String get fieldTelegramInvalid => '5–32 символа: латиница, цифры и «_»';

  @override
  String get fieldIntegerRequired => 'Целое число';

  @override
  String fieldGradeBoundOutOfRange(int max) {
    return 'От 0 до $max';
  }

  @override
  String get fieldGradeRangeInvalid => 'Минимум должен быть меньше максимума';

  @override
  String get fieldPriceRequired => 'Укажите стоимость занятия';

  @override
  String get fieldAmountRequired => 'Укажите сумму';

  @override
  String get fieldMoneyFormat => 'Сумма в рублях, например 1500 или 1500,50';

  @override
  String get fieldAmountTooLarge => 'Слишком большая сумма';

  @override
  String get fieldAmountNotPositive => 'Сумма должна быть больше нуля';

  @override
  String get failureStudentNotFound => 'Ученик не найден';

  @override
  String get failureEnrollmentNotFound => 'Предмет ученика не найден';

  @override
  String get failureSubjectNotFound => 'Предмет не найден';

  @override
  String get failureLessonNotFound => 'Занятие не найдено';

  @override
  String get failurePaymentNotFound => 'Платёж не найден';

  @override
  String get failurePackageNotFound => 'Пакет не найден';

  @override
  String get failureProgressEntryNotFound => 'Запись прогресса не найдена';

  @override
  String failureSubjectNameTaken(String name) {
    return 'Предмет «$name» уже есть';
  }

  @override
  String get failureSubjectInUse =>
      'Предмет используется в направлениях учеников';

  @override
  String get failureEnrollmentExists =>
      'У ученика уже есть направление по этому предмету';

  @override
  String failurePackageBelowUsage(int used) {
    return 'Из пакета уже списано занятий: $used. Нельзя сделать в нём меньше занятий';
  }

  @override
  String get failureLessonDurationOutOfRange =>
      'Длительность занятия — от 5 минут до 10 часов';

  @override
  String get failureLessonPriceInvalid => 'Недопустимая стоимость занятия';

  @override
  String get failureEnrollmentArchived =>
      'Предмет в архиве. Верните его из архива, чтобы планировать занятия';

  @override
  String get failureRescheduleOnlyPlanned =>
      'Перенести можно только запланированное занятие';

  @override
  String get failureGradeOnlyForCompleted =>
      'Оценку можно поставить только за проведённое занятие';

  @override
  String failureGradeOutOfScale(int min, int max) {
    return 'Оценка должна быть от $min до $max';
  }

  @override
  String get failurePaymentAmountInvalid => 'Недопустимая сумма платежа';

  @override
  String get failurePaymentDateInFuture =>
      'Дата оплаты не может быть в будущем';

  @override
  String get failureProgressEntryEmpty => 'Укажите тему, оценку или заметку';

  @override
  String get failureProgressDateInFuture =>
      'Дата записи не может быть в будущем';

  @override
  String get failureLessonOfOtherSubject =>
      'Занятие относится к другому предмету';

  @override
  String get failureLessonNotPast =>
      'Запись можно привязать только к прошедшему занятию';

  @override
  String get failureLessonHasProgressEntry =>
      'У этого занятия уже есть запись прогресса';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get settingsTheme => 'Тема';

  @override
  String get settingsThemeSystem => 'Как в системе';

  @override
  String get settingsThemeLight => 'Светлая';

  @override
  String get settingsThemeDark => 'Тёмная';

  @override
  String get settingsLanguage => 'Язык';

  @override
  String get settingsLanguageSystem => 'Как в системе';

  @override
  String get settingsDataNote => 'Данные хранятся только на этом устройстве';

  @override
  String balanceDebt(String amount) {
    return 'Долг $amount';
  }

  @override
  String balanceAdvance(String amount) {
    return 'Аванс $amount';
  }

  @override
  String get balanceNoDebt => 'Долгов нет';

  @override
  String get settingsTooltip => 'Настройки';

  @override
  String get studentsArchiveTitle => 'Архив учеников';

  @override
  String get studentsSortTooltip => 'Сортировка';

  @override
  String get studentsActiveTooltip => 'Активные ученики';

  @override
  String get studentsArchiveTooltip => 'Архив';

  @override
  String get studentsAddFab => 'Ученик';

  @override
  String get studentsNoMatchesTitle => 'Никого не нашли';

  @override
  String get studentsNoMatchesMessage => 'Измените запрос или сбросьте фильтры';

  @override
  String get studentsResetFilters => 'Сбросить фильтры';

  @override
  String get studentsArchiveEmptyTitle => 'Архив пуст';

  @override
  String get studentsArchiveEmptyMessage =>
      'Сюда попадают ученики, с которыми вы больше не занимаетесь';

  @override
  String get studentsEmptyTitle => 'Учеников пока нет';

  @override
  String get studentsEmptyMessage =>
      'Добавьте первого ученика, чтобы вести занятия и оплаты';

  @override
  String get studentSortName => 'По имени';

  @override
  String get studentSortDebt => 'По долгу';

  @override
  String get studentsSearchHint => 'Имя, телефон или Telegram';

  @override
  String get studentsDebtorsFilter => 'Должники';

  @override
  String get studentNoSubjects => 'Нет предметов';

  @override
  String get notesSaved => 'Заметка сохранена';

  @override
  String get notesAboutStudent => 'Об ученике';

  @override
  String get notesStudentNoteTitle => 'Заметка об ученике';

  @override
  String get notesSubjectHint => 'Цели, слабые места, программа';

  @override
  String get notesEditTooltip => 'Редактировать заметку';

  @override
  String get notesEmpty => 'Заметок пока нет';

  @override
  String get gradeScaleCustom => 'Своя';

  @override
  String get gradeScaleFrom => 'От';

  @override
  String get gradeScaleTo => 'До';

  @override
  String get gradeScaleHint => 'По этой шкале ставятся оценки за занятия';

  @override
  String get gradeScaleTitle => 'Шкала оценок';

  @override
  String get studentLessonsEmptyTitle => 'Занятий пока нет';

  @override
  String get studentLessonsEmptyMessage =>
      'Запланируйте первое занятие с учеником';

  @override
  String get planLesson => 'Запланировать занятие';

  @override
  String get studentPaymentsEmptyTitle => 'Оплат пока нет';

  @override
  String get studentPaymentsEmptyMessage =>
      'Здесь появятся платежи, пакеты и расчёт долга';

  @override
  String get addPayment => 'Добавить платёж';

  @override
  String get paymentShort => 'Платёж';

  @override
  String get remind => 'Напомнить';

  @override
  String get packagesSection => 'Пакеты';

  @override
  String get paymentsSection => 'Платежи';

  @override
  String get noPaymentsYet => 'Платежей пока нет';

  @override
  String get balanceLessonsOutsidePackages => 'Занятия вне пакетов';

  @override
  String get balancePaid => 'Оплачено';

  @override
  String get balanceTitle => 'Баланс';

  @override
  String get packageUsedUp => 'Использован полностью';

  @override
  String packageRemaining(int remaining, int total) {
    return 'Осталось $remaining из $total';
  }

  @override
  String packageUsageSince(String usage, String date) {
    return '$usage · от $date';
  }

  @override
  String get studentArchivedBanner => 'Ученик в архиве';

  @override
  String get restore => 'Вернуть';

  @override
  String get addContacts => 'Добавить контакты';

  @override
  String balanceChargedPaid(String charged, String paid) {
    return 'Начислено $charged · оплачено $paid';
  }

  @override
  String get subjectsTitle => 'Предметы';

  @override
  String get subjectsEmptyHint =>
      'Добавьте предмет и стоимость занятия — они понадобятся для занятий и оплат';

  @override
  String subjectArchived(String subject) {
    return '$subject · в архиве';
  }

  @override
  String rateForDuration(String price, String duration) {
    return '$price за $duration';
  }

  @override
  String get progressNoSubjectsTitle => 'Нет предметов';

  @override
  String get progressNoSubjectsMessage =>
      'Добавьте предмет, чтобы отслеживать прогресс';

  @override
  String get studentEditTitle => 'Редактирование';

  @override
  String get studentNewTitle => 'Новый ученик';

  @override
  String get fieldFullName => 'Имя и фамилия *';

  @override
  String get fieldPhone => 'Телефон';

  @override
  String get fieldTelegramHint => '@username или ссылка t.me';

  @override
  String get studentNoteHint => 'Цели, особенности, договорённости';

  @override
  String get enrollmentNewTitle => 'Новый предмет';

  @override
  String get enrollmentTitle => 'Предмет ученика';

  @override
  String get subjectNameLabel => 'Название';

  @override
  String get enterName => 'Введите название';

  @override
  String get enrollmentPrice => 'Стоимость занятия *';

  @override
  String get enrollmentPriceHelper =>
      'Подставляется в новые занятия. Прошлые занятия сохраняют свою стоимость';

  @override
  String get defaultDuration => 'Длительность по умолчанию';

  @override
  String get enrollmentNote => 'Заметка по предмету';

  @override
  String get archivedSwitch => 'В архиве';

  @override
  String get enrollmentArchivedHint =>
      'Предмет скрыт из активных, история сохраняется';

  @override
  String get addSubject => 'Добавить предмет';

  @override
  String get addSubjectHint => 'Добавьте предмет, который вы ведёте';

  @override
  String get newSubjectOption => 'Новый предмет…';

  @override
  String get tabLessons => 'Занятия';

  @override
  String get tabPayments => 'Оплаты';

  @override
  String get tabProgress => 'Прогресс';

  @override
  String get tabNotes => 'Заметки';

  @override
  String get studentMovedToArchive => 'Ученик перемещён в архив';

  @override
  String get deleteStudentTitle => 'Удалить ученика?';

  @override
  String get deleteStudentMessage =>
      'Будут удалены все занятия, оплаты и прогресс ученика. Это действие нельзя отменить.\n\nЕсли вы просто больше не занимаетесь, отправьте ученика в архив — история сохранится.';

  @override
  String get studentDeleted => 'Ученик удалён';

  @override
  String get restoreFromArchive => 'Вернуть из архива';

  @override
  String get toArchive => 'В архив';

  @override
  String get statusPlanned => 'Запланировано';

  @override
  String get statusCompleted => 'Проведено';

  @override
  String get statusCancelledByStudent => 'Отменено учеником';

  @override
  String get statusCancelledByTutor => 'Отменено мной';

  @override
  String get statusNoShow => 'Пропуск';

  @override
  String get lessonsFab => 'Занятие';

  @override
  String get noLessons => 'Занятий нет';

  @override
  String get noLessonsThisWeek => 'На этой неделе занятий нет';

  @override
  String todayWithDate(String date) {
    return 'Сегодня, $date';
  }

  @override
  String get noLessonsMessage =>
      'Запланируйте занятие или выберите другой период';

  @override
  String monthDaySemantics(String day, int count) {
    return '$day, занятий: $count';
  }

  @override
  String markedAs(String status) {
    return 'Отмечено: $status';
  }

  @override
  String get billableHint => 'Оплачивается: из пакета или в долг';

  @override
  String get notBillable => 'Не оплачивается';

  @override
  String get lessonTopic => 'Тема занятия';

  @override
  String gradeWithScale(int min, int max) {
    return 'Оценка ($min–$max)';
  }

  @override
  String get comment => 'Комментарий';

  @override
  String get commentHint => 'Что получилось, над чем поработать';

  @override
  String rescheduledTo(String dateTime) {
    return 'Перенесено на $dateTime';
  }

  @override
  String get lessonPlannedAgain => 'Занятие снова запланировано';

  @override
  String get deleteLessonTitle => 'Удалить занятие?';

  @override
  String get deleteLessonMessage =>
      'Занятие, его оценка и начисление будут удалены. Если занятие было списано из пакета, оно вернётся в пакет.';

  @override
  String get lessonDeleted => 'Занятие удалено';

  @override
  String get cancelByStudent => 'Отменил ученик';

  @override
  String get cancelNoShow => 'Ученик не пришёл';

  @override
  String get cancelByTutor => 'Отменил я';

  @override
  String get billable => 'Оплачивается';

  @override
  String get lessonTitle => 'Занятие';

  @override
  String get lessonNewTitle => 'Новое занятие';

  @override
  String get lessonNeedsStudentMessage =>
      'Занятие назначается ученику по одному из его предметов';

  @override
  String get deleteLessonTooltip => 'Удалить занятие';

  @override
  String get studentAndSubject => 'Ученик и предмет';

  @override
  String get priceRequired => 'Стоимость *';

  @override
  String get statusLabel => 'Статус';

  @override
  String get lessonNote => 'Заметка к занятию';

  @override
  String get lessonNoteHint => 'Домашнее задание, материалы';

  @override
  String get createLesson => 'Создать занятие';

  @override
  String get paidFromPackage => 'Оплачено из пакета';

  @override
  String get billableFormHint =>
      'Оплачивается: из пакета, если он есть, иначе в долг';

  @override
  String get selectStudentFirst => 'Сначала выберите ученика';

  @override
  String get studentHasNoSubjects =>
      'У ученика нет предметов — добавьте их в карточке ученика';

  @override
  String get needsMarking => 'Нужно отметить';

  @override
  String get actionCancelled => 'Отменено';

  @override
  String get actionReschedule => 'Перенести';

  @override
  String get lessonActionsTooltip => 'Действия с занятием';

  @override
  String get markOutcome => 'Отметить итог…';

  @override
  String get editOutcome => 'Изменить итог…';

  @override
  String get returnToPlanned => 'Вернуть в запланированные';

  @override
  String get methodCardTransfer => 'Перевод на карту';

  @override
  String get methodCash => 'Наличные';

  @override
  String get methodOther => 'Другое';

  @override
  String get allStudents => 'Все ученики';

  @override
  String get noPaymentsTitle => 'Платежей нет';

  @override
  String get noPaymentsMessage =>
      'Измените период или ученика либо добавьте платёж';

  @override
  String paymentsTotal(String total, String payments) {
    return 'Итого $total · $payments';
  }

  @override
  String get studentHasNoDebt => 'У ученика нет долга';

  @override
  String get reminderCopied => 'Текст скопирован — вставьте его в мессенджер';

  @override
  String get reminderTitle => 'Напоминание об оплате';

  @override
  String get reminderEditHint =>
      'Текст можно отредактировать перед копированием';

  @override
  String debtReminderText(String name, String amount) {
    return 'Здравствуйте, $name!\n\nНапоминаю об оплате занятий: к оплате $amount.\nОплатить можно переводом на карту. Если уже оплатили — спасибо, просто сообщите мне.';
  }

  @override
  String get incomeEmpty => 'За этот период нет оплат и начислений';

  @override
  String get byStudents => 'По ученикам';

  @override
  String get incomeReceived => 'Получено';

  @override
  String get incomeCharged => 'Начислено';

  @override
  String incomeBreakdown(String lessons, String packages) {
    return 'Занятия $lessons · пакеты $packages';
  }

  @override
  String incomeCompleted(String lessons) {
    return 'Проведено $lessons';
  }

  @override
  String incomeCompletedWithDuration(String lessons, String duration) {
    return 'Проведено $lessons · $duration';
  }

  @override
  String get incomeExplanation =>
      '«Получено» — деньги, пришедшие за период. «Начислено» — стоимость оплачиваемых занятий и пакетов за период.';

  @override
  String studentIncomeSubtitle(String charged, String lessons) {
    return 'Начислено $charged · $lessons';
  }

  @override
  String get paymentNewTitle => 'Новый платёж';

  @override
  String paymentSaved(String amount) {
    return 'Платёж $amount сохранён';
  }

  @override
  String get deletePaymentTitle => 'Удалить платёж?';

  @override
  String get deletePaymentMessage =>
      'Долг ученика увеличится на сумму платежа.';

  @override
  String get paymentDeleted => 'Платёж удалён';

  @override
  String get deletePaymentTooltip => 'Удалить платёж';

  @override
  String get amountRequiredLabel => 'Сумма *';

  @override
  String get paymentDate => 'Дата оплаты';

  @override
  String get paymentMethod => 'Способ';

  @override
  String get paymentCommentHint => 'Например, за октябрь';

  @override
  String get payWholeDebt => 'Вся сумма долга';

  @override
  String get noDebtorsTitle => 'Должников нет';

  @override
  String get noDebtorsMessage => 'Все ученики рассчитались за занятия';

  @override
  String get totalDebt => 'Общий долг';

  @override
  String debtorsWithAdvances(String students, String amount) {
    return '$students · авансы $amount';
  }

  @override
  String get lastPaymentNone => 'Оплат ещё не было';

  @override
  String lastPayment(String date) {
    return 'Последняя оплата $date';
  }

  @override
  String get recordPayment => 'Внести оплату';

  @override
  String get financeTabDebtors => 'Должники';

  @override
  String get financeTabIncome => 'Доходы';

  @override
  String get chartEmpty => 'График появится после первой оценки';

  @override
  String chartSemantics(String grades, String average, int max) {
    return 'График оценок: $grades, средний балл $average из $max';
  }

  @override
  String chartAverage(String average) {
    return 'среднее $average';
  }

  @override
  String get chartNoTopic => 'без темы';

  @override
  String gradeRange(int min, int max) {
    return 'От $min до $max';
  }

  @override
  String get progressDetails => 'Подробнее';

  @override
  String get noGradesYet => 'Оценок пока нет';

  @override
  String averageSummary(String average, int max, String grades) {
    return 'Средний балл $average из $max · $grades';
  }

  @override
  String toReview(String topics) {
    return 'Повторить: $topics';
  }

  @override
  String get trendUp => 'Растёт';

  @override
  String get trendDown => 'Снижается';

  @override
  String get trendStable => 'Стабильно';

  @override
  String get masteryMastered => 'Освоено';

  @override
  String get masteryGood => 'Хорошо';

  @override
  String get masteryReview => 'Повторить';

  @override
  String get masteryWeak => 'Слабо';

  @override
  String get progressEntryFab => 'Запись';

  @override
  String get goalsTitle => 'Цели и слабые места';

  @override
  String get sectionTopics => 'Темы';

  @override
  String get sectionTimeline => 'Хронология';

  @override
  String get topicsEmptyHint =>
      'Темы появятся, когда вы укажете их в занятиях или записях прогресса';

  @override
  String topicGradesAverage(String grades, String average) {
    return '$grades, в среднем $average';
  }

  @override
  String get timelineEmptyHint =>
      'Здесь появятся проведённые занятия и записи прогресса';

  @override
  String get outsideLesson => 'вне занятия';

  @override
  String get averageGrade => 'Средний балл';

  @override
  String averageOutOf(String average, int max) {
    return '$average из $max';
  }

  @override
  String gradesWithScale(String grades, int min, int max) {
    return '$grades · шкала $min–$max';
  }

  @override
  String get progressEntryTitle => 'Запись прогресса';

  @override
  String get progressEntryNewTitle => 'Новая запись';

  @override
  String get entrySaved => 'Запись сохранена';

  @override
  String get deleteEntryTitle => 'Удалить запись?';

  @override
  String get deleteEntryMessage =>
      'Оценка и заметка будут удалены. Само занятие останется.';

  @override
  String get entryDeleted => 'Запись удалена';

  @override
  String get deleteEntryTooltip => 'Удалить запись';

  @override
  String get linkLessonHelper =>
      'Привяжите запись к занятию или оставьте отдельной (например, контрольная)';

  @override
  String get noLessonLink => 'Без привязки к занятию';

  @override
  String get lessonDateHelper => 'Дата занятия';

  @override
  String get topicSavedToLesson => 'Тема сохранится и в занятии';

  @override
  String get gradeOnlyCompletedHint =>
      'Оценка ставится только за проведённое занятие';

  @override
  String get addEntry => 'Добавить запись';

  @override
  String unmarkedMore(String lessons) {
    return 'и ещё $lessons — после отметки этих они появятся здесь';
  }

  @override
  String get summaryTitle => 'Сводка';

  @override
  String get activeStudents => 'Активных учеников';

  @override
  String receivedInMonth(String month) {
    return 'Получено · $month';
  }

  @override
  String monthCaption(String charged, int completed) {
    return 'начислено $charged · проведено $completed';
  }

  @override
  String get upcomingTitle => 'Ближайшие занятия';

  @override
  String get noMoreLessonsToday => 'На сегодня больше занятий нет';

  @override
  String get noLessonsNextWeek => 'На ближайшую неделю занятий нет';

  @override
  String get planShort => 'Запланировать';

  @override
  String get allDebtors => 'Все должники';

  @override
  String get noDebtsHint => 'Долгов нет — все ученики рассчитались';
}

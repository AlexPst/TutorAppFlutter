// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Tutor';

  @override
  String get navHome => 'Home';

  @override
  String get navSchedule => 'Schedule';

  @override
  String get navFinance => 'Finance';

  @override
  String get navStudents => 'Students';

  @override
  String get languageRussian => 'Русский';

  @override
  String get languageEnglish => 'English';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonSave => 'Save';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonAdd => 'Add';

  @override
  String get commonRetry => 'Retry';

  @override
  String get commonClear => 'Clear';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonMore => 'More';

  @override
  String get commonBack => 'Back';

  @override
  String get commonForward => 'Forward';

  @override
  String get commonToday => 'Today';

  @override
  String get commonTomorrow => 'Tomorrow';

  @override
  String commonCopiedValue(String value) {
    return 'Copied: $value';
  }

  @override
  String get commonCopyTooltip => 'Copy';

  @override
  String get commonNote => 'Note';

  @override
  String get commonTopic => 'Topic';

  @override
  String get commonDate => 'Date';

  @override
  String get commonTime => 'Time';

  @override
  String get commonStudent => 'Student';

  @override
  String get commonStudentRequired => 'Student *';

  @override
  String get commonSubject => 'Subject';

  @override
  String get commonSubjectRequired => 'Subject *';

  @override
  String get commonDuration => 'Duration';

  @override
  String get commonPackage => 'Package';

  @override
  String get commonNoTopic => 'No topic';

  @override
  String get commonNotFoundMaybeDeleted => 'It may have been deleted';

  @override
  String get commonGrade => 'Grade';

  @override
  String get commonNoGrade => 'No grade';

  @override
  String get commonSelectStudent => 'Select a student';

  @override
  String get commonSelectSubject => 'Select a subject';

  @override
  String get commonAddStudentFirst => 'Add a student first';

  @override
  String get commonAddStudent => 'Add student';

  @override
  String get commonLoading => 'Loading…';

  @override
  String get leaveWithoutSavingTitle => 'Discard changes?';

  @override
  String get leaveWithoutSavingMessage => 'Your changes will be lost.';

  @override
  String get leaveAction => 'Discard';

  @override
  String get loadErrorTitle => 'Couldn\'t load data';

  @override
  String get errorUnexpected => 'Something went wrong. Please try again.';

  @override
  String get errorWidgetTitle => 'This section couldn\'t be displayed';

  @override
  String get notFoundTitle => 'Page not found';

  @override
  String get toStudentsList => 'Go to students';

  @override
  String get periodAll => 'All';

  @override
  String get periodDay => 'Day';

  @override
  String get periodWeek => 'Week';

  @override
  String get periodMonth => 'Month';

  @override
  String weekRangeSameMonth(String startDay, String endDay, String month) {
    return '$month $startDay–$endDay';
  }

  @override
  String weekRangeCrossMonth(String start, String end) {
    return '$start – $end';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String durationHours(int hours) {
    return '$hours h';
  }

  @override
  String durationHoursMinutes(int hours, int minutes) {
    return '$hours h $minutes min';
  }

  @override
  String lessonsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lessons',
      one: '$count lesson',
    );
    return '$_temp0';
  }

  @override
  String paymentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count payments',
      one: '$count payment',
    );
    return '$_temp0';
  }

  @override
  String gradesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count grades',
      one: '$count grade',
    );
    return '$_temp0';
  }

  @override
  String studentsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count students',
      one: '$count student',
    );
    return '$_temp0';
  }

  @override
  String entriesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entries',
      one: '$count entry',
    );
    return '$_temp0';
  }

  @override
  String andMore(String items) {
    return 'and $items more';
  }

  @override
  String get fieldNameRequired => 'Enter the student\'s name';

  @override
  String fieldNameTooLong(int max) {
    return 'At most $max characters';
  }

  @override
  String get fieldPhoneInvalid => 'For example, +7 900 123-45-67';

  @override
  String get fieldTelegramInvalid =>
      '5–32 characters: Latin letters, digits and “_”';

  @override
  String get fieldIntegerRequired => 'Whole number';

  @override
  String fieldGradeBoundOutOfRange(int max) {
    return 'From 0 to $max';
  }

  @override
  String get fieldGradeRangeInvalid => 'Minimum must be less than maximum';

  @override
  String get fieldPriceRequired => 'Enter the lesson price';

  @override
  String get fieldAmountRequired => 'Enter the amount';

  @override
  String get fieldMoneyFormat => 'Amount in rubles, e.g. 1500 or 1500.50';

  @override
  String get fieldAmountTooLarge => 'Amount is too large';

  @override
  String get fieldAmountNotPositive => 'Amount must be greater than zero';

  @override
  String get failureStudentNotFound => 'Student not found';

  @override
  String get failureEnrollmentNotFound => 'Student\'s subject not found';

  @override
  String get failureSubjectNotFound => 'Subject not found';

  @override
  String get failureLessonNotFound => 'Lesson not found';

  @override
  String get failurePaymentNotFound => 'Payment not found';

  @override
  String get failurePackageNotFound => 'Package not found';

  @override
  String get failureProgressEntryNotFound => 'Progress entry not found';

  @override
  String failureSubjectNameTaken(String name) {
    return 'Subject “$name” already exists';
  }

  @override
  String get failureSubjectInUse => 'The subject is used by students';

  @override
  String get failureEnrollmentExists => 'The student already has this subject';

  @override
  String failurePackageBelowUsage(int used) {
    return '$used lessons have already been used from this package. It can\'t have fewer lessons';
  }

  @override
  String get failureLessonDurationOutOfRange =>
      'Lesson duration must be between 5 minutes and 10 hours';

  @override
  String get failureLessonPriceInvalid => 'Invalid lesson price';

  @override
  String get failureEnrollmentArchived =>
      'The subject is archived. Restore it to schedule lessons';

  @override
  String get failureRescheduleOnlyPlanned =>
      'Only scheduled lessons can be rescheduled';

  @override
  String get failureGradeOnlyForCompleted =>
      'Grades can only be given for completed lessons';

  @override
  String failureGradeOutOfScale(int min, int max) {
    return 'Grade must be between $min and $max';
  }

  @override
  String get failurePaymentAmountInvalid => 'Invalid payment amount';

  @override
  String get failurePaymentDateInFuture =>
      'Payment date can\'t be in the future';

  @override
  String get failureProgressEntryEmpty => 'Enter a topic, grade or note';

  @override
  String get failureProgressDateInFuture =>
      'Entry date can\'t be in the future';

  @override
  String get failureLessonOfOtherSubject =>
      'The lesson belongs to another subject';

  @override
  String get failureLessonNotPast =>
      'An entry can only be linked to a past lesson';

  @override
  String get failureLessonHasProgressEntry =>
      'This lesson already has a progress entry';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLanguageSystem => 'System';

  @override
  String get settingsDataNote => 'Data is stored only on this device';

  @override
  String balanceDebt(String amount) {
    return 'Debt $amount';
  }

  @override
  String balanceAdvance(String amount) {
    return 'Advance $amount';
  }

  @override
  String get balanceNoDebt => 'No debt';

  @override
  String get settingsTooltip => 'Settings';

  @override
  String get studentsArchiveTitle => 'Archived students';

  @override
  String get studentsSortTooltip => 'Sort';

  @override
  String get studentsActiveTooltip => 'Active students';

  @override
  String get studentsArchiveTooltip => 'Archive';

  @override
  String get studentsAddFab => 'Student';

  @override
  String get studentsNoMatchesTitle => 'No matches';

  @override
  String get studentsNoMatchesMessage =>
      'Change the search or reset the filters';

  @override
  String get studentsResetFilters => 'Reset filters';

  @override
  String get studentsArchiveEmptyTitle => 'The archive is empty';

  @override
  String get studentsArchiveEmptyMessage =>
      'Students you no longer teach appear here';

  @override
  String get studentsEmptyTitle => 'No students yet';

  @override
  String get studentsEmptyMessage =>
      'Add your first student to track lessons and payments';

  @override
  String get studentSortName => 'By name';

  @override
  String get studentSortDebt => 'By debt';

  @override
  String get studentsSearchHint => 'Name, phone or Telegram';

  @override
  String get studentsDebtorsFilter => 'With debt';

  @override
  String get studentNoSubjects => 'No subjects';

  @override
  String get notesSaved => 'Note saved';

  @override
  String get notesAboutStudent => 'About the student';

  @override
  String get notesStudentNoteTitle => 'Note about the student';

  @override
  String get notesSubjectHint => 'Goals, weak spots, curriculum';

  @override
  String get notesEditTooltip => 'Edit note';

  @override
  String get notesEmpty => 'No notes yet';

  @override
  String get gradeScaleCustom => 'Custom';

  @override
  String get gradeScaleFrom => 'From';

  @override
  String get gradeScaleTo => 'To';

  @override
  String get gradeScaleHint => 'Lesson grades use this scale';

  @override
  String get gradeScaleTitle => 'Grading scale';

  @override
  String get studentLessonsEmptyTitle => 'No lessons yet';

  @override
  String get studentLessonsEmptyMessage =>
      'Schedule the first lesson with this student';

  @override
  String get planLesson => 'Schedule a lesson';

  @override
  String get studentPaymentsEmptyTitle => 'No payments yet';

  @override
  String get studentPaymentsEmptyMessage =>
      'Payments, packages and the debt breakdown will appear here';

  @override
  String get addPayment => 'Add payment';

  @override
  String get paymentShort => 'Payment';

  @override
  String get remind => 'Remind';

  @override
  String get packagesSection => 'Packages';

  @override
  String get paymentsSection => 'Payments';

  @override
  String get noPaymentsYet => 'No payments yet';

  @override
  String get balanceLessonsOutsidePackages => 'Lessons outside packages';

  @override
  String get balancePaid => 'Paid';

  @override
  String get balanceTitle => 'Balance';

  @override
  String get packageUsedUp => 'Fully used';

  @override
  String packageRemaining(int remaining, int total) {
    return '$remaining of $total left';
  }

  @override
  String packageUsageSince(String usage, String date) {
    return '$usage · since $date';
  }

  @override
  String get studentArchivedBanner => 'Student is archived';

  @override
  String get restore => 'Restore';

  @override
  String get addContacts => 'Add contacts';

  @override
  String balanceChargedPaid(String charged, String paid) {
    return 'Charged $charged · paid $paid';
  }

  @override
  String get subjectsTitle => 'Subjects';

  @override
  String get subjectsEmptyHint =>
      'Add a subject and lesson price — you\'ll need them for lessons and payments';

  @override
  String subjectArchived(String subject) {
    return '$subject · archived';
  }

  @override
  String rateForDuration(String price, String duration) {
    return '$price per $duration';
  }

  @override
  String get progressNoSubjectsTitle => 'No subjects';

  @override
  String get progressNoSubjectsMessage => 'Add a subject to track progress';

  @override
  String get studentEditTitle => 'Edit student';

  @override
  String get studentNewTitle => 'New student';

  @override
  String get fieldFullName => 'Full name *';

  @override
  String get fieldPhone => 'Phone';

  @override
  String get fieldTelegramHint => '@username or t.me link';

  @override
  String get studentNoteHint => 'Goals, specifics, agreements';

  @override
  String get enrollmentNewTitle => 'New subject';

  @override
  String get enrollmentTitle => 'Student\'s subject';

  @override
  String get subjectNameLabel => 'Name';

  @override
  String get enterName => 'Enter a name';

  @override
  String get enrollmentPrice => 'Lesson price *';

  @override
  String get enrollmentPriceHelper =>
      'Used for new lessons. Past lessons keep their price';

  @override
  String get defaultDuration => 'Default duration';

  @override
  String get enrollmentNote => 'Subject note';

  @override
  String get archivedSwitch => 'Archived';

  @override
  String get enrollmentArchivedHint =>
      'Hidden from active subjects; history is kept';

  @override
  String get addSubject => 'Add subject';

  @override
  String get addSubjectHint => 'Add a subject you teach';

  @override
  String get newSubjectOption => 'New subject…';

  @override
  String get tabLessons => 'Lessons';

  @override
  String get tabPayments => 'Payments';

  @override
  String get tabProgress => 'Progress';

  @override
  String get tabNotes => 'Notes';

  @override
  String get studentMovedToArchive => 'Student moved to the archive';

  @override
  String get deleteStudentTitle => 'Delete student?';

  @override
  String get deleteStudentMessage =>
      'All lessons, payments and progress of this student will be deleted. This can\'t be undone.\n\nIf you simply no longer teach them, move the student to the archive — the history will be kept.';

  @override
  String get studentDeleted => 'Student deleted';

  @override
  String get restoreFromArchive => 'Restore from archive';

  @override
  String get toArchive => 'Archive';

  @override
  String get statusPlanned => 'Scheduled';

  @override
  String get statusCompleted => 'Completed';

  @override
  String get statusCancelledByStudent => 'Cancelled by student';

  @override
  String get statusCancelledByTutor => 'Cancelled by me';

  @override
  String get statusNoShow => 'No-show';

  @override
  String get lessonsFab => 'Lesson';

  @override
  String get noLessons => 'No lessons';

  @override
  String get noLessonsThisWeek => 'No lessons this week';

  @override
  String todayWithDate(String date) {
    return 'Today, $date';
  }

  @override
  String get noLessonsMessage => 'Schedule a lesson or choose another period';

  @override
  String monthDaySemantics(String day, int count) {
    return '$day, lessons: $count';
  }

  @override
  String markedAs(String status) {
    return 'Marked: $status';
  }

  @override
  String get billableHint => 'Billable: from a package or added to the debt';

  @override
  String get notBillable => 'Not billable';

  @override
  String get lessonTopic => 'Lesson topic';

  @override
  String gradeWithScale(int min, int max) {
    return 'Grade ($min–$max)';
  }

  @override
  String get comment => 'Comment';

  @override
  String get commentHint => 'What went well, what to work on';

  @override
  String rescheduledTo(String dateTime) {
    return 'Moved to $dateTime';
  }

  @override
  String get lessonPlannedAgain => 'The lesson is scheduled again';

  @override
  String get deleteLessonTitle => 'Delete lesson?';

  @override
  String get deleteLessonMessage =>
      'The lesson, its grade and its charge will be deleted. If it was taken from a package, it goes back to the package.';

  @override
  String get lessonDeleted => 'Lesson deleted';

  @override
  String get cancelByStudent => 'The student cancelled';

  @override
  String get cancelNoShow => 'The student didn\'t show up';

  @override
  String get cancelByTutor => 'I cancelled';

  @override
  String get billable => 'Billable';

  @override
  String get lessonTitle => 'Lesson';

  @override
  String get lessonNewTitle => 'New lesson';

  @override
  String get lessonNeedsStudentMessage =>
      'A lesson is scheduled for a student in one of their subjects';

  @override
  String get deleteLessonTooltip => 'Delete lesson';

  @override
  String get studentAndSubject => 'Student and subject';

  @override
  String get priceRequired => 'Price *';

  @override
  String get statusLabel => 'Status';

  @override
  String get lessonNote => 'Lesson note';

  @override
  String get lessonNoteHint => 'Homework, materials';

  @override
  String get createLesson => 'Create lesson';

  @override
  String get paidFromPackage => 'Paid from a package';

  @override
  String get billableFormHint =>
      'Billable: from a package if there is one, otherwise added to the debt';

  @override
  String get selectStudentFirst => 'Select a student first';

  @override
  String get studentHasNoSubjects =>
      'The student has no subjects — add them in the student\'s card';

  @override
  String get needsMarking => 'Needs marking';

  @override
  String get actionCancelled => 'Cancelled';

  @override
  String get actionReschedule => 'Reschedule';

  @override
  String get lessonActionsTooltip => 'Lesson actions';

  @override
  String get markOutcome => 'Mark outcome…';

  @override
  String get editOutcome => 'Edit outcome…';

  @override
  String get returnToPlanned => 'Back to scheduled';

  @override
  String get methodCardTransfer => 'Card transfer';

  @override
  String get methodCash => 'Cash';

  @override
  String get methodOther => 'Other';

  @override
  String get allStudents => 'All students';

  @override
  String get noPaymentsTitle => 'No payments';

  @override
  String get noPaymentsMessage =>
      'Change the period or student, or add a payment';

  @override
  String paymentsTotal(String total, String payments) {
    return 'Total $total · $payments';
  }

  @override
  String get studentHasNoDebt => 'The student has no debt';

  @override
  String get reminderCopied => 'Text copied — paste it into a messenger';

  @override
  String get reminderTitle => 'Payment reminder';

  @override
  String get reminderEditHint => 'You can edit the text before copying';

  @override
  String debtReminderText(String name, String amount) {
    return 'Hello, $name!\n\nThis is a reminder about payment for our lessons: $amount is due.\nYou can pay by card transfer. If you have already paid, thank you — just let me know.';
  }

  @override
  String get incomeEmpty => 'No payments or charges in this period';

  @override
  String get byStudents => 'By student';

  @override
  String get incomeReceived => 'Received';

  @override
  String get incomeCharged => 'Charged';

  @override
  String incomeBreakdown(String lessons, String packages) {
    return 'Lessons $lessons · packages $packages';
  }

  @override
  String incomeCompleted(String lessons) {
    return 'Completed: $lessons';
  }

  @override
  String incomeCompletedWithDuration(String lessons, String duration) {
    return 'Completed: $lessons · $duration';
  }

  @override
  String get incomeExplanation =>
      '“Received” is money that came in during the period. “Charged” is the cost of billable lessons and packages in the period.';

  @override
  String studentIncomeSubtitle(String charged, String lessons) {
    return 'Charged $charged · $lessons';
  }

  @override
  String get paymentNewTitle => 'New payment';

  @override
  String paymentSaved(String amount) {
    return 'Payment of $amount saved';
  }

  @override
  String get deletePaymentTitle => 'Delete payment?';

  @override
  String get deletePaymentMessage =>
      'The student\'s debt will increase by the payment amount.';

  @override
  String get paymentDeleted => 'Payment deleted';

  @override
  String get deletePaymentTooltip => 'Delete payment';

  @override
  String get amountRequiredLabel => 'Amount *';

  @override
  String get paymentDate => 'Payment date';

  @override
  String get paymentMethod => 'Method';

  @override
  String get paymentCommentHint => 'For example, for October';

  @override
  String get payWholeDebt => 'Full debt amount';

  @override
  String get noDebtorsTitle => 'No debtors';

  @override
  String get noDebtorsMessage => 'All students have paid for their lessons';

  @override
  String get totalDebt => 'Total debt';

  @override
  String debtorsWithAdvances(String students, String amount) {
    return '$students · advances $amount';
  }

  @override
  String get lastPaymentNone => 'No payments yet';

  @override
  String lastPayment(String date) {
    return 'Last payment $date';
  }

  @override
  String get recordPayment => 'Record payment';

  @override
  String get financeTabDebtors => 'Debtors';

  @override
  String get financeTabIncome => 'Income';

  @override
  String get chartEmpty => 'The chart appears after the first grade';

  @override
  String chartSemantics(String grades, String average, int max) {
    return 'Grades chart: $grades, average $average out of $max';
  }

  @override
  String chartAverage(String average) {
    return 'average $average';
  }

  @override
  String get chartNoTopic => 'no topic';

  @override
  String gradeRange(int min, int max) {
    return 'From $min to $max';
  }

  @override
  String get progressDetails => 'Details';

  @override
  String get noGradesYet => 'No grades yet';

  @override
  String averageSummary(String average, int max, String grades) {
    return 'Average $average out of $max · $grades';
  }

  @override
  String toReview(String topics) {
    return 'Review: $topics';
  }

  @override
  String get trendUp => 'Improving';

  @override
  String get trendDown => 'Declining';

  @override
  String get trendStable => 'Stable';

  @override
  String get masteryMastered => 'Mastered';

  @override
  String get masteryGood => 'Good';

  @override
  String get masteryReview => 'Needs review';

  @override
  String get masteryWeak => 'Weak';

  @override
  String get progressEntryFab => 'Entry';

  @override
  String get goalsTitle => 'Goals and weak spots';

  @override
  String get sectionTopics => 'Topics';

  @override
  String get sectionTimeline => 'Timeline';

  @override
  String get topicsEmptyHint =>
      'Topics appear once you add them to lessons or progress entries';

  @override
  String topicGradesAverage(String grades, String average) {
    return '$grades, average $average';
  }

  @override
  String get timelineEmptyHint =>
      'Completed lessons and progress entries will appear here';

  @override
  String get outsideLesson => 'outside a lesson';

  @override
  String get averageGrade => 'Average grade';

  @override
  String averageOutOf(String average, int max) {
    return '$average out of $max';
  }

  @override
  String gradesWithScale(String grades, int min, int max) {
    return '$grades · scale $min–$max';
  }

  @override
  String get progressEntryTitle => 'Progress entry';

  @override
  String get progressEntryNewTitle => 'New entry';

  @override
  String get entrySaved => 'Entry saved';

  @override
  String get deleteEntryTitle => 'Delete entry?';

  @override
  String get deleteEntryMessage =>
      'The grade and note will be deleted. The lesson itself stays.';

  @override
  String get entryDeleted => 'Entry deleted';

  @override
  String get deleteEntryTooltip => 'Delete entry';

  @override
  String get linkLessonHelper =>
      'Link the entry to a lesson or keep it separate (e.g. a test)';

  @override
  String get noLessonLink => 'Not linked to a lesson';

  @override
  String get lessonDateHelper => 'Lesson date';

  @override
  String get topicSavedToLesson => 'The topic is also saved to the lesson';

  @override
  String get gradeOnlyCompletedHint =>
      'Grades are given only for completed lessons';

  @override
  String get addEntry => 'Add entry';

  @override
  String unmarkedMore(String lessons) {
    return '$lessons more — they\'ll appear here once these are marked';
  }

  @override
  String get summaryTitle => 'Summary';

  @override
  String get activeStudents => 'Active students';

  @override
  String receivedInMonth(String month) {
    return 'Received · $month';
  }

  @override
  String monthCaption(String charged, int completed) {
    return 'charged $charged · completed $completed';
  }

  @override
  String get upcomingTitle => 'Upcoming lessons';

  @override
  String get noMoreLessonsToday => 'No more lessons today';

  @override
  String get noLessonsNextWeek => 'No lessons in the next 7 days';

  @override
  String get planShort => 'Schedule';

  @override
  String get allDebtors => 'All debtors';

  @override
  String get noDebtsHint => 'No debts — everyone has paid';
}

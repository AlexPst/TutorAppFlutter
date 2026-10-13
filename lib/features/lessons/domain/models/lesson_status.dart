enum LessonStatus {
  planned,
  completed,
  cancelledByStudent,
  cancelledByTutor,
  noShow;

  /// Занятие в этом статусе оплачивается: списывается из пакета
  /// или начисляется по стоимости.
  bool get isBillable => switch (this) {
    completed || cancelledByStudent || noShow => true,
    planned || cancelledByTutor => false,
  };

  bool get isPlanned => this == planned;
}

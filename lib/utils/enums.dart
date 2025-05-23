enum TaskPriority {
  none,
  low,
  high;

  @override
  String toString() => switch (this) {
    TaskPriority.none => 'Нет',
    TaskPriority.low => 'Низкий',
    TaskPriority.high => 'Высокий',
  };
}

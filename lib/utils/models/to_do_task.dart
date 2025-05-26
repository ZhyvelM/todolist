import 'package:todolist/utils/enums.dart';

class ToDoTask {
  ToDoTask(this.description, this.priority, this.doUntil);

  final String description;
  final TaskPriority priority;
  final DateTime doUntil;
}

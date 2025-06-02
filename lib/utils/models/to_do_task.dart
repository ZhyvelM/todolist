import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todolist/utils/enums.dart';

part 'to_do_task.freezed.dart';

@freezed
abstract class ToDoTask with _$ToDoTask {
  const factory ToDoTask({
    required int id,
    required String description,
    required TaskPriority priority,
    required DateTime? doUntil,
    required bool completed,
  }) = _ToDoTask;
}

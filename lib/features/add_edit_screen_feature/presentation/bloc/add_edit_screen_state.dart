part of 'add_edit_screen_bloc.dart';

class AddEditScreenState extends Equatable {
  final String description;

  final TaskPriority priority;

  final DateTime doUntil;

  final bool doUntilSwitch;

  const AddEditScreenState(this.description, this.priority, this.doUntil, this.doUntilSwitch);

  AddEditScreenState.initial()
    : description = '',
      priority = TaskPriority.none,
      doUntil = DateTime.now(),
      doUntilSwitch = false;

  AddEditScreenState.fromTask(ToDoTask task)
    : description = task.description,
      priority = task.priority,
      doUntil = task.doUntil ?? DateTime.now(),
      doUntilSwitch = task.doUntil != null;

  AddEditScreenState copyWith({String? description, TaskPriority? priority, DateTime? doUntil, bool? doUntilSwitch}) =>
      AddEditScreenState(
        description ?? this.description,
        priority ?? this.priority,
        doUntil ?? this.doUntil,
        doUntilSwitch ?? this.doUntilSwitch,
      );

  @override
  List<Object?> get props => [description, priority, doUntil, doUntilSwitch];
}

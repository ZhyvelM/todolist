part of 'main_screen_bloc.dart';

class MainScreenState extends Equatable {
  final List<ToDoTask> tasks;

  int get completedTasksCount => tasks.where((task) => task.completed).length;
  List<ToDoTask> get uncompletedTasks => tasks.where((task) => !task.completed).toList();
  const MainScreenState({required this.tasks});

  MainScreenState copyWith({List<ToDoTask>? tasks}) => MainScreenState(tasks: tasks ?? []);

  @override
  List<Object?> get props => [] + tasks;
}

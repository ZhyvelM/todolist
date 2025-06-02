part of 'main_screen_bloc.dart';

@immutable
sealed class MainScreenEvent extends Equatable {}

class FetchTasks extends MainScreenEvent {
  final int index;

  FetchTasks({this.index = 0});

  @override
  List<Object?> get props => [index];
}

class DeleteTask extends MainScreenEvent {
  final int id;

  DeleteTask({required this.id});

  @override
  List<Object?> get props => [id];
}

class CompleteTaskChanged extends MainScreenEvent {
  final int id;
  final bool value;

  CompleteTaskChanged({required this.id, required this.value});

  @override
  List<Object?> get props => [id, value];
}

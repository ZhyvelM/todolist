part of 'add_edit_screen_bloc.dart';

@immutable
sealed class AddEditScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DescriptionChanged extends AddEditScreenEvent {
  final String newText;

  DescriptionChanged({required this.newText});

  @override
  List<Object?> get props => [newText];
}

class PriorityChanged extends AddEditScreenEvent {
  final TaskPriority newPriority;

  PriorityChanged({required this.newPriority});

  @override
  List<Object?> get props => [newPriority];
}

class DateSelected extends AddEditScreenEvent {
  final DateTime newDate;

  DateSelected({required this.newDate});

  @override
  List<Object?> get props => [newDate];
}

class DateSwitched extends AddEditScreenEvent {
  final bool newValue;

  DateSwitched({required this.newValue});

  @override
  List<Object?> get props => [newValue];
}

class Delete extends AddEditScreenEvent {}

class Save extends AddEditScreenEvent {}

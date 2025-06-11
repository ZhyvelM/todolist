import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todolist/utils/enums.dart';
import 'package:todolist/utils/models/to_do_task.dart';

part 'add_edit_screen_event.dart';

part 'add_edit_screen_state.dart';

class AddEditScreenBloc extends Bloc<AddEditScreenEvent, AddEditScreenState> {
  AddEditScreenBloc(ToDoTask? task)
    : super(task != null ? AddEditScreenState.fromTask(task) : AddEditScreenState.initial()) {
    on<AddEditScreenEvent>(
      (event, emit) => switch (event) {
        DescriptionChanged() => _descriptionChanged(event, emit),
        PriorityChanged() => _priorityChanged(event, emit),
        DateSelected() => _dateSelected(event, emit),
        DateSwitched() => _dateSwitched(event, emit),
        Delete() => _delete(event, emit),
        Save() => _save(event, emit),
      },
    );
  }

  _descriptionChanged(DescriptionChanged event, Emitter<AddEditScreenState> emit) {
    emit(state.copyWith(description: event.newText));
  }

  _priorityChanged(PriorityChanged event, Emitter<AddEditScreenState> emit) {
    emit(state.copyWith(priority: event.newPriority));
  }

  _dateSelected(DateSelected event, Emitter<AddEditScreenState> emit) {
    emit(state.copyWith(doUntil: event.newDate));
  }

  _dateSwitched(DateSwitched event, Emitter<AddEditScreenState> emit) {
    emit(state.copyWith(doUntilSwitch: event.newValue));
  }

  _delete(Delete event, Emitter<AddEditScreenState> emit) {
    log('Task deleted');
  }

  _save(Save event, Emitter<AddEditScreenState> emit) {
    log('Task saved');
  }
}

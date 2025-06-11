import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todolist/utils/enums.dart';
import 'package:todolist/utils/models/to_do_task.dart';

part 'main_screen_event.dart';

part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenState(tasks: [])) {
    on<MainScreenEvent>(
      (event, emit) => switch (event) {
        FetchTasks() => _fetchTasks(event, emit),
        DeleteTask() => _deleteTask(event, emit),
        CompleteTaskChanged() => _completeTaskChanged(event, emit),
      },
    );
    add(FetchTasks());
  }

  FutureOr<void> _fetchTasks(FetchTasks event, Emitter<MainScreenState> emit) {
    final now = DateTime.now();
    List<ToDoTask> tasks = List.generate(
      3,
      (index) => ToDoTask(
        description: '$index Купить что-то, где-то, зачем-то,, но точно чтобы показать как обрезается',
        priority: TaskPriority.values[index % 3],
        doUntil: now.add(Duration(days: index)),
        completed: index % 2 == 1,
        id: index,
      ),
    );

    tasks = state.tasks + tasks;
    emit(state.copyWith(tasks: tasks));
  }

  FutureOr<void> _deleteTask(DeleteTask event, Emitter<MainScreenState> emit) {
    final index = state.tasks.indexWhere((task) => task.id == event.id);
    emit(state.copyWith(tasks: state.tasks.toList()..removeAt(index)));
    log('Deleted Task with id = ${event.id}');
  }

  FutureOr<void> _completeTaskChanged(CompleteTaskChanged event, Emitter<MainScreenState> emit) {
    final index = state.tasks.indexWhere((task) => task.id == event.id);
    final newTask = state.tasks[index].copyWith(completed: event.value);
    emit(state.copyWith(tasks: state.tasks.toList()..[index] = newTask));
    log('Completion of Task with id = ${event.id} changed to: ${event.value}');
  }
}

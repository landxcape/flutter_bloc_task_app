import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';

import '../../models/task.dart';
import '../bloc_exports.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<ToggleTask>(_onToggleTask);
    on<RemoveTask>(_onRemoveTask);
    on<DeleteTask>(_onDeleteTask);
  }

  FutureOr<void> _onAddTask(
    AddTask event,
    Emitter<TasksState> emit,
  ) {
    final state = this.state;
    emit(TasksState(
      allTasks: List.from(state.allTasks)..add(event.task),
      removedTasks: state.removedTasks,
    ));
  }

  FutureOr<void> _onToggleTask(
    ToggleTask event,
    Emitter<TasksState> emit,
  ) {
    final List<Task> updatedAllTasks = [
      for (final task in state.allTasks)
        if (task == event.task) task.copyWith(isDone: !event.task.isDone) else task,
    ];

    emit(TasksState(
      allTasks: updatedAllTasks,
      removedTasks: state.removedTasks,
    ));
  }

  FutureOr<void> _onRemoveTask(
    RemoveTask event,
    Emitter<TasksState> emit,
  ) {
    final List<Task> updatedAllTasks = List.from(state.allTasks)..remove(event.task);

    emit(TasksState(
      allTasks: updatedAllTasks,
      removedTasks: List.from(state.removedTasks)
        ..add(
          event.task.copyWith(isDeleted: true),
        ),
    ));
  }

  FutureOr<void> _onDeleteTask(
    DeleteTask event,
    Emitter<TasksState> emit,
  ) {
    emit(TasksState(
      allTasks: state.allTasks,
      removedTasks: List.from(state.removedTasks)..remove(event.task),
    ));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    final mappedTasks = state.toMap();
    log(mappedTasks.toString());
    return mappedTasks;
  }
}

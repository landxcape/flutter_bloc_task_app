// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task task;
  const AddTask({
    required this.task,
  });

  @override
  List<Object> get props => [];
}
class ToggleTask extends TasksEvent {
  final Task task;
  const ToggleTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class RemoveTask extends TasksEvent {
  final Task task;
  const RemoveTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TasksEvent {
  final Task task;
  const DeleteTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}

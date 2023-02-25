part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  const TasksState({
    this.allTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  final List<Task> allTasks;
  final List<Task> removedTasks;

  @override
  List<Object> get props => [
        allTasks,
        removedTasks,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
      'removedTasks': allTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<Task>.from(
        (map['allTasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      removedTasks: List<Task>.from(
        (map['removedTasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

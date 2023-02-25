part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  const TasksState({
    required this.allTasks,
    required this.removedTasks,
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
        (map['allTasks'] as List).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      removedTasks: List<Task>.from(
        (map['removedTasks'] as List).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class TasksInitials extends TasksState {
  const TasksInitials({
    super.allTasks = const <Task>[],
    super.removedTasks = const <Task>[],
  });
}

import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(decoration: task.isDone ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        onChanged: (bool? value) => task.isDeleted ? null : context.read<TasksBloc>().add(ToggleTask(task: task)),
        value: task.isDone,
      ),
      onLongPress: () => context.read<TasksBloc>().add(
            task.isDeleted ? DeleteTask(task: task) : RemoveTask(task: task),
          ),
    );
  }
}

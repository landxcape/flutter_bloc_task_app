
import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/widgets/task_tile.dart';

import '../models/task.dart';

class TaskListBuilder extends StatelessWidget {
  const TaskListBuilder({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: tasksList.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 4.0),
      itemBuilder: (BuildContext context, int index) {
        final task = tasksList.elementAt(index);

        return TaskTile(task: task);
      },
    );
  }
}
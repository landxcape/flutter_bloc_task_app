import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/drawer/custom_drawer.dart';

import '../../blocs/bloc_exports.dart';
import '../../widgets/task_list_builder.dart';
import 'add_task_widget.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);
  static const routeName = '/tasksScreen';

  void _addTasks(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const AddTaskWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {
          final int tasksCount = state.allTasks.length;

          return Column(
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '$tasksCount task${tasksCount > 1 ? 's' : ''}',
                  ),
                ),
              ),
              Expanded(child: TaskListBuilder(tasksList: state.allTasks)),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTasks(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}

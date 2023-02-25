import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';
import '../../widgets/task_list_builder.dart';
import '../drawer/custom_drawer.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({super.key});
  static const routeName = '/recycleBinScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Bin'),
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
          final int tasksCount = state.removedTasks.length;

          return Column(
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '$tasksCount task${tasksCount > 1 ? 's' : ''}',
                  ),
                ),
              ),
              Expanded(child: TaskListBuilder(tasksList: state.removedTasks)),
            ],
          );
        },
      ),
    );
  }
}

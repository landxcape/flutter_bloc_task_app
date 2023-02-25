import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/counter/counter_screen.dart';
import 'package:flutter_tasks_app/screens/recycle_bin/recycle_bin_screen.dart';
import 'package:flutter_tasks_app/screens/tasks_screen/tasks_screen.dart';

import '../../blocs/bloc_exports.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    bool switchValue = false;
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              child: Text('Tasks Drawer'),
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () => Navigator.of(context).pushReplacementNamed(CounterScreen.routeName),
                  leading: const Icon(Icons.timer),
                  title: const Text('Counter'),
                  trailing: Text(state.counterValue.toString()),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () => Navigator.of(context).pushReplacementNamed(TasksScreen.routeName),
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text(state.allTasks.length.toString()),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () => Navigator.of(context).pushReplacementNamed(RecycleBinScreen.routeName),
                  leading: const Icon(Icons.delete),
                  title: const Text('Bin'),
                  trailing: Text(state.removedTasks.length.toString()),
                );
              },
            ),
            const Divider(),
            StatefulBuilder(
              builder: (context, setState) {
                return Switch(
                  value: switchValue,
                  onChanged: (newValue) => setState(() => switchValue = newValue),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}

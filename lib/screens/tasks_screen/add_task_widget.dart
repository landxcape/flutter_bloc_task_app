import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/app.dart';

import '../../blocs/bloc_exports.dart';
import '../../models/task.dart';



class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({super.key});


  @override
  Widget build(BuildContext context) {
  final TextEditingController _textEditingController = TextEditingController();
  
    return AlertDialog(
      title: Text(
        'Add Task',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: TextField(
        autofocus: true,
        controller: _textEditingController,
        decoration: const InputDecoration(
          label: Text('Title'),
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final task = Task(title: _textEditingController.text);
            // use bloc without context
            tasksBloc.add(AddTask(task: task));
            Navigator.of(context).pop();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}

import 'dart:math';

import 'package:flutter_tasks_app/models/task.dart';

class MockData {
  static List<Task> tasksList = List.generate(
    Random().nextInt(90) + 10,
    (index) => Task(
      title: 'Task ${index + 1}',
      isDone: Random().nextBool(),
      isDeleted: Random().nextBool(),
    ),
  );
}

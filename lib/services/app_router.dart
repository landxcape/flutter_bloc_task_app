import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/counter/counter_screen.dart';
import 'package:flutter_tasks_app/screens/recycle_bin/recycle_bin_screen.dart';
import 'package:flutter_tasks_app/screens/tasks_screen/tasks_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TasksScreen.routeName:
        return MaterialPageRoute(builder: (_) => const TasksScreen());
      case RecycleBinScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RecycleBinScreen());
      case CounterScreen.routeName:
      default:
        return MaterialPageRoute(builder: (_) => const CounterScreen());

    }
  }
}

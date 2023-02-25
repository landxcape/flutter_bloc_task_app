import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/services/app_router.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/bloc_exports.dart';
import 'screens/tasks_screen/tasks_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required AppRouter appRouter})
      : _appRouter = appRouter,
        super(key: key);

  final AppRouter _appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<TasksBloc>(
          create: (context) => TasksBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Tasks App',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.teal,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
        home: const TasksScreen(),
      ),
    );
  }
}

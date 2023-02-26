import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_tasks_app/screens/counter/counter_screen.dart';
import 'package:flutter_tasks_app/services/app_router.dart';
import 'package:path_provider/path_provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(Phoenix(
    child: MyApp(
      appRouter: AppRouter(),
    ),
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
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<TasksBloc>(create: (context) => TasksBloc()),
        BlocProvider<UseDarkThemeBloc>(create: (context) => UseDarkThemeBloc()),
        BlocProvider<UseMaterialThreeBloc>(create: (context) => UseMaterialThreeBloc()),
      ],
      child: BlocBuilder<UseMaterialThreeBloc, UseMaterialThreeState>(
        builder: (context, useMaterialThreeState) {
          return BlocBuilder<UseDarkThemeBloc, UseDarkThemeState>(
            builder: (context, useDarkThemeState) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Tasks App',
                theme: ThemeData(
                  useMaterial3: useMaterialThreeState.useMaterialThree,
                  brightness: useDarkThemeState.useDarkTheme ? Brightness.dark : Brightness.light,
                  primarySwatch: Colors.teal,
                ),
                onGenerateRoute: _appRouter.onGenerateRoute,
                initialRoute: CounterScreen.routeName,
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/counter/counter_screen.dart';
import 'package:flutter_tasks_app/widgets/dialog/custom_dialog.dart';
import 'package:flutter_tasks_app/widgets/loading/loading_widget.dart';

import '../blocs/bloc_exports.dart';
import '../services/app_router.dart';
import 'login/login_screen.dart';

// to use without context
final TasksBloc tasksBloc = TasksBloc();

class App extends StatelessWidget {
  const App({Key? key, required AppRouter appRouter})
      : _appRouter = appRouter,
        super(key: key);

  final AppRouter _appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(create: (_) => AppBloc()..add(const AppEventInitialize())),
        BlocProvider<ThemeColorSchemeBloc>(create: (_) => ThemeColorSchemeBloc()),
        BlocProvider<CounterBloc>(create: (_) => CounterBloc()),
        // to use without context
        BlocProvider<TasksBloc>(create: (_) => tasksBloc),
        BlocProvider<UseDarkThemeBloc>(create: (_) => UseDarkThemeBloc()),
        BlocProvider<UseMaterialThreeBloc>(create: (_) => UseMaterialThreeBloc()),
      ],
      child: BlocBuilder<UseMaterialThreeBloc, UseMaterialThreeState>(
        builder: (context, useMaterialThreeState) {
          return BlocBuilder<ThemeColorSchemeBloc, ThemeColorSchemeState>(
            builder: (context, themeColorSchemeState) {
              return BlocBuilder<UseDarkThemeBloc, UseDarkThemeState>(
                builder: (context, useDarkThemeState) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Tasks App',
                    theme: ThemeData(
                      useMaterial3: useMaterialThreeState.useMaterialThree,
                      brightness: useDarkThemeState.useDarkTheme ? Brightness.dark : Brightness.light,
                      colorSchemeSeed: themeColorSchemeState.colorScheme.scheme,
                    ),
                    onGenerateRoute: _appRouter.onGenerateRoute,
                    home: BlocConsumer<AppBloc, AppState>(
                      listener: (context, appState) {
                        if (appState.isLoading) {
                          LoadingWidget.instance().show(
                            context: context,
                            text: 'Loading...',
                          );
                        } else {
                          LoadingWidget.instance().hide();
                        }
                        final authError = appState.authError;
                        if (authError != null) {
                          CustomDialog.showAuthError(
                            context: context,
                            authError: authError,
                          );
                        }
                      },
                      builder: (context, appState) {
                        switch (appState.runtimeType) {
                          case AppStateLoggedIn:
                            return const CounterScreen();
                          case AppStateLoggedOut:
                          case AppStateIsInRegistrationView:
                          default:
                            return const LoginScreen();
                        }
                      },
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

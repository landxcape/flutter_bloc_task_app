import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/extensions/string_extensions.dart';

import '../../blocs/bloc_exports.dart';
import '../../widgets/form_input_field.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/loginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<UseDarkThemeBloc, UseDarkThemeState>(
              builder: (context, state) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: IconButton(
                      onPressed: () => context.read<UseDarkThemeBloc>().add(state.useDarkTheme ? UseDarkThemeOffEvent() : UseDarkThemeOnEvent()),
                      icon: Icon(state.useDarkTheme ? Icons.light_mode : Icons.dark_mode),
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: PhysicalModel(
                    elevation: 6.0,
                    borderRadius: BorderRadius.circular(20.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                      child: BlocBuilder<AppBloc, AppState>(
                        builder: (context, appState) {
                          final bool isRegisterView = appState is AppStateIsInRegistrationView;

                          return Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FormInputField(
                                  controller: _emailController,
                                  initialValue: 'landxcape09@gmail.com'.ifDebugging,
                                  lableText: 'Email',
                                  hintText: 'username@example.com',
                                ),
                                const SizedBox(height: 20.0),
                                FormInputField(
                                  controller: _passwordController,
                                  initialValue: 'testPassword'.ifDebugging,
                                  obsecureText: true,
                                  lableText: 'Password',
                                  hintText: 'testPassword',
                                ),
                                const SizedBox(height: 20.0),
                                ElevatedButton(
                                  onPressed: () {
                                    final email = _emailController.text;
                                    final password = _passwordController.text;

                                    context.read<AppBloc>().add(
                                          isRegisterView
                                              ? AppEventRegister(
                                                  email: email,
                                                  password: password,
                                                )
                                              : AppEventLogIn(
                                                  email: email,
                                                  password: password,
                                                ),
                                        );
                                  },
                                  child: Text(isRegisterView ? 'Register' : 'Login'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.read<AppBloc>().add(
                                          isRegisterView ? const AppEventGoToLogin() : const AppEventGoToRegistration(),
                                        );
                                  },
                                  child: Text(isRegisterView ? 'Already registered? Log in here!' : 'Not registered yet? Register here!'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

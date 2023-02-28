import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/resources/app_color_scheme_enum.dart';
import 'package:flutter_tasks_app/resources/color_manager.dart';

import '../../auth/auth_error.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

class CustomDialog {
  static Future<AppColorScheme?> showColorThemeChoice({
    required BuildContext context,
  }) {
    return showDialog<AppColorScheme>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Select Color Scheme',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: AppColorScheme.values.map(
                (colorScheme) {
                  // return IconButton(
                  //   onPressed: () => Navigator.of(context).pop(colorScheme),
                  //   icon: Icon(
                  //     Icons.circle,
                  //     color: colorScheme.scheme,
                  //   ),
                  // );
                  return InkWell(
                    onTap: () => Navigator.of(context).pop(colorScheme),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Container(
                        height: 40,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: ColorManager.createColorSwatch(colorScheme.scheme).values.toList(),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        );
      },
    );
  }

  static Future<T?> showGenericDialog<T>({
    required BuildContext context,
    required String title,
    required String content,
    required DialogOptionBuilder optionsBuilder,
  }) {
    final options = optionsBuilder();
    return showDialog<T>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: options.keys.map((optionTitle) {
            final value = options[optionTitle];
            return TextButton(
              onPressed: () {
                if (value != null) {
                  Navigator.of(context).pop(value);
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Text(optionTitle),
            );
          }).toList(),
        );
      },
    );
  }

  static Future<bool> showDeleteAccountDialog(BuildContext context) {
    return showGenericDialog<bool>(
      context: context,
      title: 'Delete account',
      content: 'Are you sure you want to delete your account? You cannot undo this operation!',
      optionsBuilder: () => {
        'Cancel': false,
        'Delete account': true,
      },
    ).then(
      (value) => value ?? false,
    );
  }

  static Future<bool> showLogOutDialog(BuildContext context) {
    return showGenericDialog<bool>(
      context: context,
      title: 'Log out',
      content: 'Are you sure you want to log out?',
      optionsBuilder: () => {
        'Cancel': false,
        'Log out': true,
      },
    ).then(
      (value) => value ?? false,
    );
  }

  static Future<void> showAuthError({
    required BuildContext context,
    required AuthError authError,
  }) {
    return showGenericDialog<void>(
      context: context,
      title: authError.dialogTitle,
      content: authError.dialogText,
      optionsBuilder: () => {
        'OK': true,
      },
    );
  }
}

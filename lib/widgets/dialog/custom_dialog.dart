import 'package:flutter/material.dart';

import '../../auth/auth_error.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

class CustomDialog {
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

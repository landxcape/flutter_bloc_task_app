import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  const FormInputField({
    super.key,
    this.controller,
    this.initialValue,
    this.obsecureText,
    this.lableText,
    this.hintText,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final bool? obsecureText;
  final String? lableText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    bool? obsecureTextState = obsecureText;
    controller?.text = initialValue ?? '';

    return StatefulBuilder(builder: (context, setState) {
      return TextFormField(
        controller: controller,
        obscureText: obsecureTextState ?? false,
        decoration: InputDecoration(
          suffixIcon: obsecureText == null
              ? null
              : IconButton(
                  onPressed: () => setState(() {
                    if (obsecureTextState != null) {
                      obsecureTextState = !obsecureTextState!;
                    }
                  }),
                  icon: Icon(obsecureTextState! ? Icons.visibility : Icons.visibility_off),
                ),
          labelText: lableText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );
    });
  }
}

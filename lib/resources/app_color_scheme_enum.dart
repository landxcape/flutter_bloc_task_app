import 'package:flutter/material.dart' show Color, Colors;

enum AppColorScheme {
  red(Colors.red),
  pink(Colors.pink),
  purple(Colors.purple),
  deepPurple(Colors.deepPurple),
  indigo(Colors.indigo),
  blue(Colors.blue),
  lightBlue(Colors.lightBlue),
  cyan(Colors.cyan),
  teal(Colors.teal),
  green(Colors.green),
  lightGreen(Colors.lightGreen),
  lime(Colors.lime),
  yellow(Colors.yellow),
  amber(Colors.amber),
  orange(Colors.orange),
  deepOrange(Colors.deepOrange);

  final Color scheme;
  const AppColorScheme(this.scheme);
}

import 'package:flutter/material.dart' show Color, Colors;

enum AppColorScheme {

  teal(Colors.teal),
  blue(Colors.blue),
  lightBlue(Colors.lightBlue),
  green(Colors.green),
  amber(Colors.amber),
  cyan(Colors.cyan),
  orange(Colors.orange),
  deepOrange(Colors.deepOrange),
  
  ;

  final Color scheme;
  const AppColorScheme(this.scheme);
}



import 'package:flutter/material.dart';

class MyThemes{
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    // iconTheme: const IconThemeData(color: Colors.green)
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromRGBO(242, 242, 242, 1),
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    // iconTheme: const IconThemeData(color: Colors.deepOrange)
  );
}

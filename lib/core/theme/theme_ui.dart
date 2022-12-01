import 'package:flutter/material.dart';

class ThemeUI {
  ThemeUI._();

  static final ThemeData theme = ThemeData.light().copyWith(
    primaryColor: const Color.fromARGB(255, 75, 72, 110),
    scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
    //fontFamily: 'inter',
    // primaryColorDark: const Color(0xFF4B4D73),
    primaryColorLight: const Color.fromARGB(255, 75, 72, 110),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: const Color.fromARGB(255, 75, 72, 110),
    scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
    //fontFamily: 'inter',
    // primaryColorDark: const Color(0xFF4B4D73),
    primaryColorLight: const Color.fromARGB(255, 75, 72, 110),
  );
}

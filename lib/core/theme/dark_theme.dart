import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
  cardColor: const Color(0xFF1B1921),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 0, 0, 0),
    foregroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor:
          const Color.fromARGB(255, 80, 60, 150), // Brighter primary
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
    bodySmall: TextStyle(color: Colors.white60, fontSize: 12),
    titleLarge: TextStyle(
        color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(
        color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold),
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color.fromARGB(255, 80, 60, 150), // Brighter primary
    secondary: Color.fromARGB(255, 160, 150, 200), // Brighter secondary
    surface: Color.fromARGB(255, 40, 21, 58), // Card background
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Color.fromARGB(255, 172, 157, 185), // Secondary text
  ),
);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
  cardColor: const Color(0xFFF5F5F5),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    foregroundColor: Colors.black,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor:
          const Color.fromARGB(255, 100, 80, 200), // Brighter primary
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
    bodySmall: TextStyle(color: Colors.black54, fontSize: 12),
    titleLarge: TextStyle(
        color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(
        color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),
  ),
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 100, 80, 200), // Brighter primary
    secondary: Color.fromARGB(255, 180, 160, 220), // Brighter secondary
    surface: Color.fromARGB(255, 240, 240, 240), // Card background
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Color.fromARGB(255, 100, 100, 100), // Secondary text
  ),
);

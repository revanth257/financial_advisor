import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: const Color(0xFF1A237E),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.indigo,
      accentColor: const Color(0xFF1A237E),
    ).copyWith(
      secondary: const Color(0xFF1A237E),
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A237E),
      foregroundColor: Colors.white,
      elevation: 2,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A237E),
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1A237E),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.black54,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF1A237E), width: 2),
      ),
      labelStyle: const TextStyle(color: Colors.black54),
    ),
    cardTheme: CardTheme(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    useMaterial3: true,
  );
}
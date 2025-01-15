import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      secondary: Color(0xFFB5B0EA),
      tertiary: Color(0xFFCED86B),
      background: Colors.white,
      surface: Colors.white,
    ),
    textTheme: GoogleFonts.interTextTheme(),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      secondary: Color(0xFFB5B0EA),
      tertiary: Color(0xFFCED86B),
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E),
    ),
    textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
  );
}

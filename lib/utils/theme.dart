import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'material_theme.dart';

class AppTheme {
  static ThemeData lightTheme() {
    final textTheme = GoogleFonts.manropeTextTheme();
    
    return MaterialTheme(textTheme).light().copyWith(
      textTheme: textTheme,
      primaryTextTheme: textTheme,
    );
  }

  static ThemeData darkTheme() {
    final textTheme = GoogleFonts.manropeTextTheme(ThemeData.dark().textTheme);
    
    return MaterialTheme(textTheme).dark().copyWith(
      textTheme: textTheme,
      primaryTextTheme: textTheme,
    );
  }

  static ThemeData getTheme(Brightness brightness) {
    return brightness == Brightness.light ? lightTheme() : darkTheme();
  }
} 
import 'package:flutter/material.dart';
import 'package:music_player_app/core/theme/app_pallete.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(25),
      enabledBorder: _border(Pallete.borderColor),
      focusedBorder: _border(Pallete.gradient2),
    ),
  );
}

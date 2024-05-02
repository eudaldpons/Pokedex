import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get defaultTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFFFF0000),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFFF0000),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get bugTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF94BC4A),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF94BC4A),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get darkTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF736C75),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF736C75),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get dragonTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF6A7BAF),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF6A7BAF),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get electricTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFFE5C531),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE5C531),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get fairyTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFFE397D1),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE397D1),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get fightingTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFFCB5F48),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFCB5F48),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get fireTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFFEA7A3C),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFEA7A3C),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get flyingTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF7DA6DE),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF7DA6DE),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get ghostTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF846AB6),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF846AB6),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get grassTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF71C558),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF71C558),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get groundTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFFCC9F4F),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFCC9F4F),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get iceTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF70CBD4),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF70CBD4),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get normalTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFFAAB09F),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFAAB09F),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get poisonTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFFB468B7),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFB468B7),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get psychicTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFFE5709B),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE5709B),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get rockTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFFB2A061),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFB2A061),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get steelTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF89A1B0),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF89A1B0),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );

  static ThemeData get waterTheme => ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF539AE2),
        ),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF539AE2),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      );
}

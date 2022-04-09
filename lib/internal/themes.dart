// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:cryptotrack/internal/extensions.dart';

Brightness brightnessAppBar(BuildContext context) {
  return context.theme.brightness == Brightness.light
      ? Brightness.dark
      : Brightness.light;
}

abstract class Themes {
  static const double paddingMainTop = 24;
  static const double paddingMainLeft = 24;
  static const double paddingMainRight = 24;

  static const Color lightMainColor = Colors.blueAccent;
  static const Color lightColor = Colors.white;
  static const Color lightSecondaryColor = Color(0xFFFAFAFA);
  static const Color darkMainColor = Colors.blueAccent;
  static const Color darkColor = Color(0xFF212121);
  static const Color darkSecondaryColor = Color(0xFF161616);
  static const Color blackMainColor = Colors.blueAccent;
  static const Color blackColor = Color(0xFF212121);
  static const Color blackSecondaryColor = Color(0xFF000000);

  static ThemeData get light => getThemeFromScheme(
        scheme: ColorScheme(
          primary: lightMainColor,
          secondary: lightMainColor,
          surface: lightColor,
          background: lightSecondaryColor,
          error: Colors.red.shade500,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.grey.shade900,
          onBackground: Colors.grey.shade900,
          onError: Colors.grey.shade900,
          brightness: Brightness.light,
        ),
      );

  static ThemeData get dark => getThemeFromScheme(
        scheme: ColorScheme(
          primary: darkMainColor,
          secondary: darkMainColor,
          surface: darkColor,
          background: darkSecondaryColor,
          error: Colors.red.shade400,
          onPrimary: Colors.grey.shade900,
          onSecondary: Colors.grey.shade900,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.grey.shade900,
          brightness: Brightness.dark,
        ),
      );

  static ThemeData get black => getThemeFromScheme(
        scheme: ColorScheme(
          primary: blackMainColor,
          secondary: blackMainColor,
          surface: blackColor,
          background: blackSecondaryColor,
          error: Colors.red.shade400,
          onPrimary: Colors.grey.shade900,
          onSecondary: Colors.grey.shade900,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.grey.shade900,
          brightness: Brightness.dark,
        ),
      );

  static ThemeData getThemeFromScheme({required ColorScheme scheme}) {
    final ThemeData base = scheme.brightness == Brightness.dark
        ? ThemeData.dark()
        : ThemeData.light();

    return base.copyWith(
      colorScheme: scheme,

      // Scaffold
      scaffoldBackgroundColor: scheme.background,

      // App Bar
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: scheme.onSurface),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: scheme.onBackground,
          fontSize: 28,
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: scheme.background,
      ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),

      // Card
      cardTheme: CardTheme(
        color: scheme.surface,
      ),

      // Navigation Rail
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: scheme.surface,
        selectedIconTheme: const IconThemeData(
          size: 28,
        ),
      ),

      // Bottom Navigation
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: scheme.surface,
        selectedIconTheme: const IconThemeData(
          size: 28,
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 8,
      ),
    );
  }
}

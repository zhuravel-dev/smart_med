import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class SmartMedTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.textLight,
      surface: AppColors.light,
      onSurface: AppColors.textDark,
      background: AppColors.background,
      onBackground: AppColors.textDark,
      outline: AppColors.border,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      foregroundColor: AppColors.textDark,
      iconTheme: IconThemeData(color: AppColors.textDark),
    ),

    textTheme: const TextTheme(
      // Display
      displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400, color: AppColors.textDark),
      displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, color: AppColors.textDark),
      displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, color: AppColors.textDark),

      // Headline
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: AppColors.textDark),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: AppColors.textDark),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: AppColors.textDark),

      // Title
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textDark),
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textDark),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textMuted),

      // Body
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textDark),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textDark),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textMuted),

      // Label
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textDark),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textDark),
      labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.textDark),
    ),

    dividerColor: AppColors.dividerLine,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.navBarBackground,
      selectedItemColor: AppColors.navItemActive,
      unselectedItemColor: AppColors.navItemInactive,
      selectedIconTheme: IconThemeData(color: AppColors.navIcon),
      unselectedIconTheme: IconThemeData(color: AppColors.navIcon),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textLight,
        shape: const StadiumBorder(),
        elevation: 0,
        disabledBackgroundColor: AppColors.border,
        disabledForegroundColor: AppColors.textMuted,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.light,
      hintStyle: const TextStyle(color: AppColors.textMuted),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
  );
}

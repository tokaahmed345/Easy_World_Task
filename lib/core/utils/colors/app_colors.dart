import 'package:flutter/material.dart';

abstract class AppColors {
  // ===== Core neutrals =====
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color whiteColor70 = Colors.white70;

  // ===== Brand colors (Rick & Morty) =====

  static const Color primary = Color(0xFF5AB9EA);
  static const Color primaryDark = Color(0xFF3E8FBF);
  static const Color secondary = Color(0xFF8FA6B8);
  static const Color accentPortal = Color(0xFF7ED49A);

  // ===== Text / surfaces =====
  static const Color charcoal = Color(0xFF1B2028);
  static const Color lightBackground = Color(0xFFF5F8FA);
  static const Color tipsBackground = Color(0xFFE9F3FA);

  // ===== Status colors =====
  static const Color statusAlive = Colors.blueAccent;
  static const Color statusDead = Color(0xFFE06A6A);
  static const Color statusUnknown = Color(0xFF9AA5B0);
  static const Color redColor = Colors.red;
  static const Color greenColor = Colors.green;
  static const Color greyColor = Colors.grey;

  // ===== Dark mode variants =====
  static const Color darkBackground = Color(0xFF0D1115);
  static const Color darkSurface = Color(0xFF161C22);
  static const Color darkSurfaceElevated = Color(0xFF1C2733);
  static const Color darkBorder = Color(0xFF253141);
  static const Color blueGrey = Color(0xFF7D8FA0);
}

extension AppColorsExtension on BuildContext {
  bool get _isDark => Theme.of(this).brightness == Brightness.dark;

  Color get backgroundColor =>
      _isDark ? AppColors.darkBackground : AppColors.lightBackground;

  Color get surfaceColor =>
      _isDark ? AppColors.darkSurface : AppColors.whiteColor;

  Color get elevatedSurfaceColor =>
      _isDark ? AppColors.darkSurfaceElevated : const Color(0xFFEFF4F8);

  Color get primaryTextColor =>
      _isDark ? const Color(0xFFE8F2FB) : AppColors.charcoal;

  Color get secondaryTextColor =>
      _isDark ? const Color(0xFF7D8FA0) : const Color(0xFF5B6672);

  Color get primaryColor => _isDark ? AppColors.primary : AppColors.primaryDark;

  Color get secondaryColor => AppColors.secondary;

  Color get accentColor => AppColors.accentPortal;

  Color get tipsBackgroundColor =>
      _isDark ? const Color(0xFF132632) : AppColors.tipsBackground;

  Color get greyColor => _isDark ? Colors.grey[400]! : Colors.grey[600]!;

  Color get borderColor =>
      _isDark ? AppColors.darkBorder : const Color(0xFFD9E4EC);

  Color statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'alive':
        return AppColors.statusAlive;
      case 'dead':
        return AppColors.statusDead;
      default:
        return AppColors.statusUnknown;
    }
  }
}

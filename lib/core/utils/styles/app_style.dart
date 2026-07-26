import 'package:character_hub/core/utils/colors/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static final TextStyle _baseStyle = GoogleFonts.poppins(
    color: AppColors.whiteColor,
  );

  static final text28 = _baseStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );

  static final text20 = _baseStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static final text18 = _baseStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static final text16 = _baseStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static final text14 = _baseStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static final text12 = _baseStyle.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );

  // ===== App bar / headers =====
  static final appLogo = _baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );

  static final screenTitle = _baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  // ===== Character card =====
  static final characterName = _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static final characterSubtitle = _baseStyle.copyWith(
    color: AppColors.secondary,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final statusBadge = _baseStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w600,
  );

  static final searchHint = _baseStyle.copyWith(
    color: AppColors.secondary,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final filterSectionTitle = _baseStyle.copyWith(
    color: AppColors.secondary,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static final chipText = _baseStyle.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  // ===== Buttons =====
  static final buttonText = _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static final linkText = _baseStyle.copyWith(
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );

  // ===== Empty / error states =====
  static final emptyStateTitle = _baseStyle.copyWith(
    color: AppColors.secondary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final errorText = _baseStyle.copyWith(
    color: AppColors.statusDead,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  // ===== Toast / snack =====
  static final toastText = _baseStyle.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );
}
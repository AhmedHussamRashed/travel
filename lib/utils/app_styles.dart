import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF4A90E2);
  static const Color lightBlue = Color(0xFF87CEEB);
  static const Color darkBlue = Color(0xFF2E5BBA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color darkGray = Color(0xFF666666);
  static const Color textDark = Color(0xFF333333);
  static const Color textLight = Color(0xFF888888);
  static const Color red = Color(0xFFE74C3C);
  static const Color orange = Color(0xFFF39C12);
  static const Color green = Color(0xFF27AE60);
  static const Color purple = Color(0xFF9B59B6);
  static const Color yellow = Color(0xFFF1C40F);
  static const Color black = Color(0xFF000000);
}

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textLight,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}


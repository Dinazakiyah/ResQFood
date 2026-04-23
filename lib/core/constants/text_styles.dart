import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const title = TextStyle(
    color: AppColors.white,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.6,
  );

  static const subtitle = TextStyle(
    color: AppColors.lightGreen,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const small = TextStyle(
    color: Colors.white60,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
  );
}
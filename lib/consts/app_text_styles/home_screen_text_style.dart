import 'package:flutter/material.dart';
import '../app_colors.dart';

class HomeScreenTextStyle {
  static const TextStyle bannerTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static TextStyle bannerText = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.4),
  );
}

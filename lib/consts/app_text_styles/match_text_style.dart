import 'package:flutter/material.dart';
import '../app_colors.dart';

class MatchTextStyle {
  static const TextStyle button = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 17.0,
    fontWeight: FontWeight.w400,
    color: AppColors.greenColor,
  );
  static TextStyle score = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );

  static const TextStyle team = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static const TextStyle statistics = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor);

  static TextStyle subtitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.4),
  );
  static TextStyle title = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor.withOpacity(0.6),
  );
}

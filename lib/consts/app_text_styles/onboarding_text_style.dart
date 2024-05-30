import 'package:flutter/material.dart';
import 'package:goal/consts/app_colors.dart';

class OnboardingTextStyle {
  static const TextStyle introduction = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 30.0,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
  );
  static TextStyle description = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
  static const TextStyle title = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle subtitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 13.0,
    color: Colors.white,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle button = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 17.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}

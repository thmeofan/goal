import 'package:flutter/material.dart';
import '../app_colors.dart';

class SettingsTextStyle {
  static const TextStyle tile = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static const TextStyle title = TextStyle(
    fontFamily: 'Inter',
    fontSize: 26.0,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
  static TextStyle bannerNotChosen = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor.withOpacity(0.4),
  );
  static const TextStyle bannerChosen = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
  static const TextStyle bannerSubTitle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );
  static const TextStyle back = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
}

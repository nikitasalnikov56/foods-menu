import 'package:flutter/material.dart';
import 'package:flutter_test_work/ui/theme/app_colors.dart';

abstract class AppStyle {
  static TextStyle fontStyle = const TextStyle(
    fontSize: 18,
    fontFamily: 'SfProDisplay',
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_test_work/ui/theme/app_colors.dart';
import 'package:flutter_test_work/ui/theme/app_style.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Санкт-Петербург',
          style: AppStyle.fontStyle.copyWith(height: 1),
        ),
        Text(
          '12 Августа, 2023',
          style: AppStyle.fontStyle.copyWith(
            color: AppColors.lightBlackColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
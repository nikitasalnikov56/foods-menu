import 'package:flutter/material.dart';
import 'package:flutter_test_work/ui/theme/app_colors.dart';

class RowButtons extends StatelessWidget {
  const RowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: FloatingActionButton.extended(
            backgroundColor: AppColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onPressed: () {},
            label: const Icon(Icons.favorite_border),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 40,
          height: 40,
          child: FloatingActionButton.extended(
            backgroundColor: AppColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            label: const Icon(
              Icons.close,
            ),
          ),
        ),
      ],
    );
  }
}
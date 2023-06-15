import 'package:flutter/material.dart';
import 'package:flutter_test_work/ui/components/avatar_widget/avatar_widget.dart';
import 'package:flutter_test_work/ui/theme/app_colors.dart';
import 'package:flutter_test_work/ui/theme/app_style.dart';

class CategoryAppBar extends StatelessWidget {
  const CategoryAppBar({super.key, required this.name});
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 28, right: 16),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.blackColor,
            ),
          ),
          Text(
            '$name',
            style: AppStyle.fontStyle.copyWith(color: AppColors.blackColor),
          ),
          const AvatarWidget(),
        ],
      ),
    );
  }
}

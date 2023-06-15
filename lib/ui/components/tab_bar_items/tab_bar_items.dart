import 'package:flutter/material.dart';
import 'package:flutter_test_work/blocks/dishes_bloc/dishes_bloc.dart';
import 'package:flutter_test_work/domain/provider/category_provider.dart';
import 'package:flutter_test_work/ui/theme/app_colors.dart';
import 'package:flutter_test_work/ui/theme/app_style.dart';
import 'package:provider/provider.dart';

class TabBarItems extends StatelessWidget {
  const TabBarItems({
    super.key,
    required this.state,
  });
  final DishesLoadedState state;
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CategoryProvider>(context);

    return ListView.separated(
      padding: const EdgeInsets.only(left: 16),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            model.setIndex(index);
            model.sortedDishes(index, state);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: model.count == index
                  ? AppColors.blueColor
                  : AppColors.cardColor,
            ),
            alignment: Alignment.center,
            height: 35,
            width: 94,
            child: Text(
              model.tags[index],
              textAlign: TextAlign.center,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: model.count == index
                    ? AppColors.whiteColor
                    : AppColors.blackColor,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 8),
      itemCount: 4,
    );
  }
}

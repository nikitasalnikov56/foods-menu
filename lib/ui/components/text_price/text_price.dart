import 'package:flutter/material.dart';
import 'package:flutter_test_work/blocks/dishes_bloc/dishes_bloc.dart';
import 'package:flutter_test_work/ui/theme/app_colors.dart';
import 'package:flutter_test_work/ui/theme/app_style.dart';

class TextPrice extends StatelessWidget {
  const TextPrice({super.key, required this.state, required this.index});
  final DishesLoadedState state;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${state.loadedDishes.dishes?[index].price}₽ · ',
          style: AppStyle.fontStyle.copyWith(
            fontSize: 14,
          ),
        ),
        Text(
          '${state.loadedDishes.dishes?[index].weight}г',
          style: AppStyle.fontStyle.copyWith(
            fontSize: 14,
            color: AppColors.blackColor.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}

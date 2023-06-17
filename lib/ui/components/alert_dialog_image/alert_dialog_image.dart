import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_work/blocks/dishes_bloc/dishes_bloc.dart';
import 'package:flutter_test_work/ui/components/row_buttons/row_buttons.dart';
import 'package:flutter_test_work/ui/theme/app_colors.dart';

class AlertDialogImage extends StatelessWidget {
  const AlertDialogImage({
    super.key,
    required this.state,
    required this.index,
  });

  final DishesLoadedState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: CachedNetworkImage(
              imageUrl: '${state.loadedDishes?[index].imageUrl}',
              width: 198,
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            right: 8,
            top: 8,
            child: RowButtons(),
          ),
          //
        ],
      ),
    );
  }
}

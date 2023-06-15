import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_work/blocks/dishes_bloc/dishes_bloc.dart';
import 'package:flutter_test_work/domain/provider/category_provider.dart';
import 'package:flutter_test_work/ui/components/alert_dialog_image/alert_dialog_image.dart';
import 'package:flutter_test_work/ui/components/tab_bar_items/tab_bar_items.dart';
import 'package:flutter_test_work/ui/components/text_price/text_price.dart';
import 'package:flutter_test_work/ui/theme/app_colors.dart';
import 'package:flutter_test_work/ui/theme/app_style.dart';
import 'package:provider/provider.dart';

class CategoryGirdItems extends StatelessWidget {
  const CategoryGirdItems({super.key});
  @override
  Widget build(BuildContext context) {
    // final model = Provider.of<CategoryProvider>(context);
    return BlocBuilder<DishesBloc, DishesState>(
      builder: (context, state) {
        if (state is DishesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DishesLoadedState) {
          return Column(
            children: [
              SizedBox(
                height: 35,
                child: TabBarItems(state: state),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Product(
                                state: state,
                                index: i,
                              );
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 110,
                              height: 110,
                              padding: const EdgeInsets.all(13),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.cardColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(
                                '${state.loadedDishes.dishes?[i].imageUrl}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${state.loadedDishes.dishes?[i].name}',
                              style: AppStyle.fontStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: state.loadedDishes.dishes?.length,
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

class Product extends StatelessWidget {
  const Product({
    super.key,
    required this.state,
    required this.index,
  });
  final DishesLoadedState state;
  final int index;
  @override
  Widget build(BuildContext context) {
    final model = context.watch<CategoryProvider>();
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      surfaceTintColor: AppColors.whiteColor,
      contentPadding: const EdgeInsets.all(16),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AlertDialogImage(state: state, index: index),
          const SizedBox(height: 8),
          Text(
            '${state.loadedDishes.dishes?[index].name}',
            style: AppStyle.fontStyle.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          TextPrice(
            state: state,
            index: index,
          ),
          const SizedBox(height: 8),
          Text(
            '${state.loadedDishes.dishes?[index].description}',
            style: AppStyle.fontStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor.withOpacity(0.65),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15)),
              onPressed: () {
                model.addItem(context, index, state);
              },
              child: Text(
                'Добавить в корзину',
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 16,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

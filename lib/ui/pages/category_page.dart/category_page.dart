import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_work/blocks/dishes_bloc/dishes_bloc.dart';
import 'package:flutter_test_work/domain/api/category_repository.dart';
import 'package:flutter_test_work/ui/components/category_appbar/category_appbar.dart';
import 'package:flutter_test_work/ui/components/category_grid_items/category_gird_items.dart';
import 'package:flutter_test_work/ui/components/tab_bar_items/tab_bar_items.dart';
import 'package:flutter_test_work/ui/theme/app_colors.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    super.key,
 
  });

 
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments;
    final String name = arg is String ? arg : '';
    return BlocProvider(
      create: (context) => DishesBloc(dishesRepository: CategoryRepository())
        ..add(DishesLoadEvent()),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              CategoryAppBar(
                name: name,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 35,
                child: TabBarItems(),
              ),
              const Expanded(
                child: CategoryGirdItems(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

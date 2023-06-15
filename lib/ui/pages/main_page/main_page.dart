import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_work/blocks/bloc/category_bloc.dart';
import 'package:flutter_test_work/domain/api/category_repository.dart';
import 'package:flutter_test_work/ui/components/app_bar_widget/app_bar_widget.dart';
import 'package:flutter_test_work/ui/components/category_list/category_list.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryBloc(categoryRepository: CategoryRepository())
            ..add(CategoryLoadEvent()),
      child: const Scaffold(
        body: MainPageBody(),
      ),
    );
  }
}

class MainPageBody extends StatelessWidget {
  const MainPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Column(
        children: [
          AppBarWidget(),
          Expanded(
            child: CategoryList(),
          ),
        ],
      ),
    );
  }
}

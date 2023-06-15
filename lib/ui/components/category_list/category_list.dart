import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_work/blocks/bloc/category_bloc.dart';
import 'package:flutter_test_work/domain/api/category_repository.dart';
import 'package:flutter_test_work/domain/models/categories.dart';
import 'package:flutter_test_work/ui/routes/app_routes.dart';
import 'package:flutter_test_work/ui/theme/app_style.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CategoryLoadedState) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 15),
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () async {
                  final Categories loadedCategories =
                      await CategoryRepository().getAllCategories();
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(
                    context,
                    AppRoutes.categoryPage,
                    arguments: loadedCategories.category?[i].name,
                  );
                },
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 50),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '${state.loadedCategories.category?[i].imageUrl}',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  //',
                  child: Text(
                    '${state.loadedCategories.category?[i].name}',
                    textAlign: TextAlign.justify,
                    style: AppStyle.fontStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, i) => const SizedBox(height: 8),
            itemCount: state.loadedCategories.category!.length,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

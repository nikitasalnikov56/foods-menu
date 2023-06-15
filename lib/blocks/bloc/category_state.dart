part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final Categories loadedCategories;
  CategoryLoadedState({required this.loadedCategories});
}

class CategoryErrorState extends CategoryState {}

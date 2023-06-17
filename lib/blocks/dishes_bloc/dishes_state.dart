part of 'dishes_bloc.dart';

@immutable
abstract class DishesState {
  const DishesState();
}

class DishesInitial extends DishesState {}

class DishesLoadingState extends DishesState {}

class DishesLoadedState extends DishesState {
  final List<Dishes>? loadedDishes;

  final DishesCategory dishesCategory;
 const  DishesLoadedState({
    required this.loadedDishes,
    required this.dishesCategory,
  });
}

class DishesErrorState extends DishesState {}

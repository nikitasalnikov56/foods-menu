part of 'dishes_bloc.dart';

@immutable
abstract class DishesState {
  const DishesState();
}

class DishesInitial extends DishesState {}

class DishesLoadingState extends DishesState {}

class DishesLoadedState extends DishesState {
  final DishesCategory loadedDishes;
  
  const DishesLoadedState({required this.loadedDishes,});
}

class DishesErrorState extends DishesState {}

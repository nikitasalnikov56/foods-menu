part of 'dishes_bloc.dart';

@immutable
abstract class DishesEvent {}

class DishesLoadEvent extends DishesEvent {}
class DishesSaladEvent extends DishesEvent {}
class DishesRiseEvent extends DishesEvent {}
class DishesFishEvent extends DishesEvent {}
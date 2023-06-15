part of 'dishes_bloc.dart';

@immutable
abstract class DishesEvent {}

class DishesLoadEvent extends DishesEvent {}
class DishesChangeEvent extends DishesEvent {}
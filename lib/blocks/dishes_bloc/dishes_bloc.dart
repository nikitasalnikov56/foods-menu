import 'package:bloc/bloc.dart';
import 'package:flutter_test_work/domain/api/category_repository.dart';
import 'package:flutter_test_work/domain/models/dishes_category.dart';
import 'package:meta/meta.dart';

part 'dishes_event.dart';
part 'dishes_state.dart';

class DishesBloc extends Bloc<DishesEvent, DishesState> {
  final CategoryRepository dishesRepository;
  DishesBloc({required this.dishesRepository}) : super(DishesInitial()) {
    on<DishesLoadEvent>((event, emit) async {
      emit(DishesLoadingState());

      try {
        final DishesCategory dishesCategory =
            await dishesRepository.getAllDishes();

        emit(
          DishesLoadedState(
            dishesCategory: dishesCategory,
            loadedDishes: dishesCategory.dishes
                ?.where((el) => el.tegs!.contains('Все меню'))
                .toList(),
          ),
        );
      } catch (_) {
        emit(DishesErrorState());
      }
    });

    on<DishesSaladEvent>((event, emit) async {
      emit(DishesLoadingState());
      try {
        final DishesCategory dishesCategory =
            await dishesRepository.getAllDishes();

        emit(
          DishesLoadedState(
            dishesCategory: dishesCategory,
            loadedDishes: dishesCategory.dishes
                ?.where((el) => el.tegs!.contains('Салаты'))
                .toList(),
          ),
        );
      } catch (_) {
        emit(DishesErrorState());
      }
    });
    on<DishesRiseEvent>((event, emit) async {
      emit(DishesLoadingState());
      try {
        final DishesCategory dishesCategory =
            await dishesRepository.getAllDishes();

        emit(
          DishesLoadedState(
            dishesCategory: dishesCategory,
            loadedDishes: dishesCategory.dishes
                ?.where((el) => el.tegs!.contains('С рисом'))
                .toList(),
          ),
        );
      } catch (_) {
        emit(DishesErrorState());
      }
    });
    on<DishesFishEvent>((event, emit) async {
      emit(DishesLoadingState());

      try {
        final DishesCategory dishesCategory =
            await dishesRepository.getAllDishes();

        emit(
          DishesLoadedState(
            dishesCategory: dishesCategory,
            loadedDishes: dishesCategory.dishes
                ?.where((el) => el.tegs!.contains('С рыбой'))
                .toList(),
          ),
        );
      } catch (_) {
        emit(DishesErrorState());
      }
    });
  }
}

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
        emit(DishesLoadedState(loadedDishes: dishesCategory));
      } catch (_) {
        emit(DishesErrorState());
      }
    });
    
  }
  
}


  // String sakdj = 'a';
  // List names = ['a', 'b', 'c'];
  // List filteredList = [];

  // for (var i = 0; i < names.length; i++) {
  //   if (sakdj== names[i]) {
      
  //   }
  // }
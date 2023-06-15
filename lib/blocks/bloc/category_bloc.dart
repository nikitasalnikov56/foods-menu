import 'package:bloc/bloc.dart';
import 'package:flutter_test_work/domain/api/category_repository.dart';
import 'package:flutter_test_work/domain/models/categories.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;
  CategoryBloc({required this.categoryRepository}) : super(CategoryInitial()) {
    on<CategoryLoadEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        final Categories loadedCategories =
            await categoryRepository.getAllCategories();
        emit(CategoryLoadedState(loadedCategories: loadedCategories));
      } catch (_) {
        emit(CategoryErrorState());
      }
    });
  }
}

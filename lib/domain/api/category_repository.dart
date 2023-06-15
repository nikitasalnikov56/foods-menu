import 'package:flutter_test_work/domain/api/api.dart';
import 'package:flutter_test_work/domain/models/categories.dart';
import 'package:flutter_test_work/domain/models/dishes_category.dart';

class CategoryRepository {
  Future<Categories> getAllCategories() => Api.getCategories();
  Future<DishesCategory> getAllDishes() => Api.getDishes();
}

import 'package:flutter/material.dart';
import 'package:flutter_test_work/blocks/dishes_bloc/dishes_bloc.dart';
import 'package:flutter_test_work/domain/hive/basket_list.dart';
import 'package:flutter_test_work/domain/hive/hive_boxes.dart';
import 'package:flutter_test_work/domain/models/dishes_category.dart';
import 'package:flutter_test_work/ui/pages/basket_page/basket_page.dart';
import 'package:flutter_test_work/ui/pages/main_page/main_page.dart';
import 'package:flutter_test_work/ui/pages/profile_page/profile_page.dart';
import 'package:flutter_test_work/ui/pages/search_page/search_page.dart';
import 'package:hive/hive.dart';

class CategoryProvider extends ChangeNotifier {
  DishesCategory? dishesCategory;
  DishesLoadedState? state;

  List<Widget> screens = [
    const MainPage(),
    const SearchPage(),
    const BasketPage(),
    const ProfilePage(),
  ];

  int count = 0;

  setIndex(int index) {
    count = index;
    notifyListeners();
  }

  //
  List<Dishes>? sortedList;
  List<String> tags = [
    'Все меню',
    'Салаты',
    'С рисом',
    'С рыбой',
  ];
  Future<void> sortedDishes(int index, DishesLoadedState state) async {
    List<String>? listTags;
    listTags = state.loadedDishes.dishes?[index].tegs;
    var list =
        listTags?.where((element) => element == tags[index]).toList().join();
    if (list == tags[index]) {
      sortedList = state.loadedDishes.dishes;

      notifyListeners();
    }
  }

  //
  int ammount = 0;


  //add to basket
  Future<void> addItem(
      BuildContext context, int index, DishesLoadedState state) async {
    var box = Hive.box<BasketList>(HiveBoxes.basketBox);

    box
        .add(
          BasketList(
            imgUrl: '${state.loadedDishes.dishes?[index].imageUrl}',
            name: '${state.loadedDishes.dishes?[index].name}',
            price: state.loadedDishes.dishes?[index].price,
            weight: state.loadedDishes.dishes?[index].weight,
          ),
        )
        .then((value) => Navigator.pop(context));
  }

  //delete Item
  Future<void> deleteItem(int index) async {
    var box = Hive.box<BasketList>(HiveBoxes.basketBox);
    box.deleteAt(index);
  }
}

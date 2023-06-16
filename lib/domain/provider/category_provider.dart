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
import 'package:shared_preferences/shared_preferences.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryProvider() {
    getSum();
  }

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

  // sort list
  String sortTegs = '';
  List<Dishes>? sortedList;
  List<String> tags = [
    'Все меню',
    'Салаты',
    'С рисом',
    'С рыбой',
  ];

  inputTags(int index) {
    sortTegs = tags[index];
  }

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

  // basket page
  int amount = 1;
  List<int> myAmmount = [];

  inremCount() {
    notifyListeners();
  }

  List<int> myArray = [];

  var box = Hive.box<BasketList>(HiveBoxes.basketBox);
  int total = 0;
  int sum = 0;

  Future<int> sumTotal() async {
    for (var el in box.values) {
      total = el.price!;
    }
    myArray.add(total);
    sum = myArray.reduce((value, element) => value + element);
    final pref = await SharedPreferences.getInstance();
    await pref.setInt('sum', sum);
    notifyListeners();
    return sum;
  }

  Future<int> getSum() async {
    final pref = await SharedPreferences.getInstance();
    sum = pref.getInt('sum') ?? 0;
    return sum;
  }

  //add to basket
  Future<void> addItem(
      BuildContext context, int index, DishesLoadedState state) async {
    var box = Hive.box<BasketList>(HiveBoxes.basketBox);

    await box
        .add(
          BasketList(
            imgUrl: '${state.loadedDishes.dishes?[index].imageUrl}',
            name: '${state.loadedDishes.dishes?[index].name}',
            price: state.loadedDishes.dishes?[index].price,
            weight: state.loadedDishes.dishes?[index].weight,
          ),
        )
        .then((value) => sumTotal())
        .then((value) => Navigator.pop(context));
  }

  //delete Item
  Future<void> deleteItem(int index) async {
    var box = Hive.box<BasketList>(HiveBoxes.basketBox);
    box.deleteAt(index);
    sum = 0;
    final pref = await SharedPreferences.getInstance();
    await pref.setInt('sum', sum);
    notifyListeners();
  }
}

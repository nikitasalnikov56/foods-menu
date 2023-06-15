import 'dart:convert';

import 'package:flutter_test_work/domain/models/categories.dart';
import 'package:flutter_test_work/domain/models/dishes_category.dart';
import 'package:http/http.dart' as http;

class Api {
  //https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54

  static Future<Categories> getCategories() async {
    Uri url = Uri.parse(
        'https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54');

    final response = await http.get(url);
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return Categories.fromJson(json);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  static Future<DishesCategory> getDishes() async {
    Uri url = Uri.parse(
        'https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b');

    final response = await http.get(url);
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return DishesCategory.fromJson(json);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}

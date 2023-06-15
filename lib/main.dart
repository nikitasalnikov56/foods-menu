import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_work/domain/hive/basket_list.dart';
import 'package:flutter_test_work/domain/hive/hive_boxes.dart';
import 'package:flutter_test_work/product_app.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));


  await Hive.initFlutter();
  Hive.registerAdapter(BasketListAdapter());
  await Hive.openBox<BasketList>(HiveBoxes.basketBox);

  // var box = Hive.box<BasketList>(HiveBoxes.basketBox);
  // box.clear();
  runApp(const ProductApp());
}

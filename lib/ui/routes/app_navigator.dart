import 'package:flutter/material.dart';
import 'package:flutter_test_work/ui/pages/category_page.dart/category_page.dart';
import 'package:flutter_test_work/ui/pages/error_page/error_page.dart';
import 'package:flutter_test_work/ui/pages/main_page/main_page.dart';
import 'package:flutter_test_work/ui/routes/app_routes.dart';

class AppNavigator {
  static String initRoute = AppRoutes.home;

  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.home: (_) => const MainPage(),
      AppRoutes.categoryPage: (_) => const CategoryPage(),
    };
  }

  static Route generate(RouteSettings settings) {
    final setting = RouteSettings(
      name: '/404',
      arguments: settings.arguments,
    );

    return MaterialPageRoute(
      settings: setting,
      builder: (_) => const Error404Page(),
    );
  }
}

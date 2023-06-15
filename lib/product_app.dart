import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_work/domain/provider/category_provider.dart';
import 'package:flutter_test_work/ui/resources/svg_icons.dart';
import 'package:flutter_test_work/ui/routes/app_navigator.dart';
import 'package:flutter_test_work/ui/theme/app_colors.dart';
import 'package:provider/provider.dart';

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryProvider(),
      child: const MaterialAppWidget(),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const ScaffoldWidget(),
    );
  }
}

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CategoryProvider>(context);
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          height: 70,
          border: const Border(
            top: BorderSide(
              color: AppColors.borderColor,
            ),
          ),
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: NavigatioTabsItem(
                icon: SvgIcons.homeIcon,
                text: 'Главная',
                active: 'false',
              ),
              activeIcon: NavigatioTabsItem(
                icon: SvgIcons.homeIcon,
                text: 'Главная',
                active: 'active',
              ),
            ),
            BottomNavigationBarItem(
              icon: NavigatioTabsItem(
                icon: SvgIcons.searchIcon,
                text: 'Поиск',
                active: 'false',
              ),
              activeIcon: NavigatioTabsItem(
                icon: SvgIcons.searchIcon,
                text: 'Поиск',
                active: 'active',
              ),
            ),
            BottomNavigationBarItem(
              icon: NavigatioTabsItem(
                icon: SvgIcons.bagIcon,
                text: 'Корзина',
                active: 'false',
              ),
              activeIcon: NavigatioTabsItem(
                icon: SvgIcons.bagIcon,
                text: 'Корзина',
                active: 'active',
              ),
            ),
            BottomNavigationBarItem(
              icon: NavigatioTabsItem(
                icon: SvgIcons.profileIcon,
                text: 'Аккаунт',
                active: 'false',
              ),
              activeIcon: NavigatioTabsItem(
                icon: SvgIcons.profileIcon,
                text: 'Аккаунт',
                active: 'active',
              ),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            routes: AppNavigator.routes,
            onGenerateRoute: AppNavigator.generate,
            builder: (context) {
              return model.screens[index];
            },
          );
        },
      ),
    );
  }
}

class NavigatioTabsItem extends StatelessWidget {
  final String icon, text, active;
  const NavigatioTabsItem({
    super.key,
    required this.icon,
    required this.text,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(top: 14),
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            color:
                active == 'active' ? AppColors.blueColor : AppColors.greyColor,
          ),
          const SizedBox(height: 7),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: active == 'active'
                  ? AppColors.blueColor
                  : AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test_work/domain/hive/basket_list.dart';
import 'package:flutter_test_work/domain/hive/hive_boxes.dart';
import 'package:flutter_test_work/domain/provider/category_provider.dart';
import 'package:flutter_test_work/ui/components/app_bar_widget/app_bar_widget.dart';
import 'package:flutter_test_work/ui/theme/app_colors.dart';
import 'package:flutter_test_work/ui/theme/app_style.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CategoryProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const AppBarWidget(),
            const SizedBox(height: 23),
            Expanded(
              child: ValueListenableBuilder<Box<BasketList>>(
                  valueListenable:
                      Hive.box<BasketList>(HiveBoxes.basketBox).listenable(),
                  builder: (context, value, _) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(
                              value.getAt(index)!.imgUrl ??
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1200px-No-Image-Placeholder.svg.png',
                              fit: BoxFit.cover,
                            ),
                            title: Text(value.getAt(index)?.name ?? 'Error'),
                            subtitle: Row(
                              children: [
                                Text(
                                  '${value.getAt(index)?.price ?? 'Error'}₽ ·',
                                  style: AppStyle.fontStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '${value.getAt(index)?.weight ?? 'Error'}г',
                                  style: AppStyle.fontStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        AppColors.blackColor.withOpacity(0.65),
                                  ),
                                ),
                              ],
                            ),
                            trailing: Container(
                              height: 32,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEFEEEC),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {
                                   
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                  Text(
                                    '${model.ammount}',
                                    style: AppStyle.fontStyle
                                        .copyWith(fontSize: 14),
                                  ),
                                  IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {
                                    
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 16,
                            ),
                        itemCount: value.length);
                  }),
            ),
            SizedBox(
              width: double.infinity,
              child: FloatingActionButton.extended(
                backgroundColor: AppColors.blueColor,
                onPressed: () {},
                label: Text(
                  'Оплатить ${model.state} ₽',
                  style: AppStyle.fontStyle.copyWith(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

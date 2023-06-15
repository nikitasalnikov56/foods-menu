import 'package:hive_flutter/hive_flutter.dart';

part 'basket_list.g.dart';

@HiveType(typeId: 0)
class BasketList {
  
  @HiveField(0)
  String? name;
  
@HiveField(1)
  String? imgUrl;
  
@HiveField(2)
  int? price;
  
@HiveField(3)
  int? weight;
  
  BasketList({this.name, this.imgUrl, this.price, this.weight});
}

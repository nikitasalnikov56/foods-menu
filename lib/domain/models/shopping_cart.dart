import 'package:flutter_test_work/domain/models/dishes_category.dart';

class ShoppingCart {
  final String name;
  final String imageUrl;
  final double price;
  final double weight;

  const ShoppingCart({
    required this.name,
    required this.imageUrl,
    required this.weight,
    required this.price,
  });

  static const List<Dishes> products = [];
}

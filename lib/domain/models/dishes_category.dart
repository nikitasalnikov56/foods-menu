class DishesCategory {
  List<Dishes>? dishes;

  DishesCategory({this.dishes});

  DishesCategory.fromJson(Map<String, dynamic> json) {
    if (json['dishes'] != null) {
      dishes = <Dishes>[];
      json['dishes'].forEach((v) {
        dishes!.add(Dishes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dishes != null) {
      data['dishes'] = dishes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dishes {
  int? id;
  String? name;
  int? price;
  int? weight;
  String? description;
  String? imageUrl;
  List<String>? tegs;

  Dishes(
      {this.id,
      this.name,
      this.price,
      this.weight,
      this.description,
      this.imageUrl,
      this.tegs});

  Dishes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    weight = json['weight'];
    description = json['description'];
    imageUrl = json['image_url'];
    tegs = json['tegs'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['weight'] = weight;
    data['description'] = description;
    data['image_url'] = imageUrl;
    data['tegs'] = tegs;
    return data;
  }
}



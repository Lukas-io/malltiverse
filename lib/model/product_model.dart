import 'package:hive/hive.dart';

import '../config/constants.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  final double price;

  @HiveField(2)
  final String imageUrl;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  int quantity;

  ProductModel({
    this.quantity = 0,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json["name"],
      price: json["current_price"][0]["NGN"][0],
      imageUrl: "$kBaseApiUrl/images/${json['photos'][0]['url']}",
      description: json["description"],
    );
  }

  set setName(String title) => {title = this.name};

  get getPrice {
    String commaPrice = price.toInt().toString();
    final regExp = RegExp(r'(\d)(?=(\d{3})+(?!\d))');

    return commaPrice.splitMapJoin(
      regExp,
      onMatch: (match) => '${match[1]},',
      onNonMatch: (nonMatch) => nonMatch,
    );
  }
}

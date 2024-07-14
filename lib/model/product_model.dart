import '../config/constants.dart';

class ProductModel {
  String name;
  final double price;
  final String imageUrl;
  final String? description;
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

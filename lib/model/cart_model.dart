import 'package:hive/hive.dart';
import 'package:malltiverse/model/product_model.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel extends HiveObject {
  @HiveField(0)
  final DateTime date = DateTime.now();

  @HiveField(1)
  final List<ProductModel> cartItems;

  @HiveField(2)
  final double amountPaid;

  CartModel({required this.cartItems, required this.amountPaid});
}

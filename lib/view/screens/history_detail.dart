import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:malltiverse/model/product_model.dart';
import 'package:malltiverse/view/widget/history_item.dart';

import '../../config/constants.dart';
import '../../providers/cart_provider.dart';

class HistoryDetailScreen extends ConsumerWidget {
  final ProductModel productItem;
  final DateTime dateTime;
  final String status;

  const HistoryDetailScreen(
      {super.key,
      required this.productItem,
      required this.dateTime,
      this.status = "COMPLETED"});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CachedNetworkImage(
                imageUrl: productItem.imageUrl,
                height: 200.0,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Text(
                productItem.name.split(":")[1],
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0),
              ),
            ),
            Text(
              status,
              style:
                  const TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Quantity:",
                      ),
                      Text(
                        "${productItem.quantity} pcs",
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price:",
                      ),
                      Text(
                        '$kNairaSymbol ${productItem.getPrice}',
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date:",
                      ),
                      Text(
                        getDate(dateTime),
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(cartProvider.notifier).addToCart(productItem);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Added to cart'),
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(milliseconds: 300),
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Buy Again',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

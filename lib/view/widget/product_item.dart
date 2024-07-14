import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:malltiverse/config/constants.dart';
import 'package:malltiverse/view/widget/stars.dart';

import '../../model/product_model.dart';
import '../../providers/cart_provider.dart';

class ProductItem extends ConsumerWidget {
  final ProductModel productModel;

  const ProductItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: kProductImageBackgroundColor,
              ),
              height: 180.0,
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl: productModel.imageUrl,
                fit: BoxFit.fitHeight,
                height: 100.0,
              ),
            ),
          ]),
          SizedBox(
            height: 16.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                productModel.name.split(":")[1],
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  productModel.description!,
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              Stars(
                stars: productModel.price.toInt() % 6,
                size: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  '$kNairaSymbol ${productModel.getPrice}',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: kPrimaryColor),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  ref.read(cartProvider.notifier).addToCart(productModel);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to cart'),
                    ),
                  );
                },
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black87),
                ),
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  side:
                      WidgetStateProperty.all(BorderSide(color: kPrimaryColor)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

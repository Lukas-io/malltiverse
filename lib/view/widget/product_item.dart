import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:malltiverse/config/constants.dart';
import 'package:malltiverse/view/widget/stars.dart';

import '../../model/product_model.dart';
import '../../providers/cart_provider.dart';

class ProductItem extends ConsumerStatefulWidget {
  final ProductModel productModel;

  const ProductItem({super.key, required this.productModel});

  @override
  ConsumerState<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends ConsumerState<ProductItem> {
  @override
  Widget build(BuildContext context) {
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
                imageUrl: widget.productModel.imageUrl,
                fit: BoxFit.fitHeight,
                height: 100.0,
              ),
            ),
          ]),
          const SizedBox(
            height: 16.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.productModel.name.split(":")[1],
                style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  widget.productModel.description!,
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              Stars(
                stars: widget.productModel.price.toInt() % 6,
                size: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  '$kNairaSymbol ${widget.productModel.getPrice}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: kPrimaryColor),
                ),
              ),
              ref.read(cartProvider.notifier).isInCart(widget.productModel)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => setState(() {
                                ref
                                    .read(cartProvider.notifier)
                                    .decreaseQuantity(widget.productModel);
                              }),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1.0)),
                                child: const Text(
                                  "-",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Text(ref
                                .read(cartProvider.notifier)
                                .getQuantity(widget.productModel)
                                .toString()),
                            InkWell(
                              onTap: () => setState(() {
                                ref
                                    .read(cartProvider.notifier)
                                    .addToCart(widget.productModel);
                              }),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1.0)),
                                child: const Text(
                                  "+",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : OutlinedButton(
                      onPressed: () {
                        setState(() {
                          ref
                              .read(cartProvider.notifier)
                              .addToCart(widget.productModel);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Added to cart'),
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(
                                vertical: 90.0, horizontal: 20.0),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        side: WidgetStateProperty.all(
                            const BorderSide(color: kPrimaryColor)),
                      ),
                      child: const Text(
                        "Add To Cart",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black87),
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}

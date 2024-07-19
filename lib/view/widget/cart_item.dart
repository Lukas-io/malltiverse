import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:malltiverse/config/constants.dart';
import 'package:malltiverse/model/product_model.dart';

import '../../providers/cart_provider.dart';

class CartItem extends ConsumerWidget {
  final ProductModel productModel;

  const CartItem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.fromBorderSide(
          BorderSide(
              width: 0.3, color: const Color(0XFF2A2A2A).withOpacity(0.4)),
        ),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: productModel.imageUrl,
            width: 100.0,
            height: 100.0,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productModel.name.split(":")[1],
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            productModel.description!,
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () => ref
                            .read(cartProvider.notifier)
                            .removeFromCart(productModel),
                        icon: ImageIcon(Image.asset(pTrash).image)),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => ref
                              .read(cartProvider.notifier)
                              .decreaseQuantity(productModel),
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            margin:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration:
                                BoxDecoration(border: Border.all(width: 1.0)),
                            child: const Text(
                              "-",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Text(productModel.quantity.toString()),
                        InkWell(
                          onTap: () => ref
                              .read(cartProvider.notifier)
                              .addToCart(productModel),
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            margin:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration:
                                BoxDecoration(border: Border.all(width: 1.0)),
                            child: const Text(
                              "+",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '$kNairaSymbol ${productModel.getPrice}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16.0),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

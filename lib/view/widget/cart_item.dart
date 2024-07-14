import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.fromBorderSide(
          BorderSide(width: 0.3, color: Color(0XFF2A2A2A).withOpacity(0.4)),
        ),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: productModel.imageUrl,
            width: 100.0,
            height: 100.0,
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 210.0,
                          child: Text(
                            productModel.name.split(":")[1],
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                            width: 180.0,
                            child: Text(
                              productModel.description!,
                              style: TextStyle(fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                    IconButton(
                        onPressed: () => ref
                            .read(cartProvider.notifier)
                            .removeFromCart(productModel),
                        icon: ImageIcon(Image.asset(pTrash).image)),
                  ],
                ),
                SizedBox(
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
                            child: Text(
                              "-",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            margin: EdgeInsets.symmetric(horizontal: 12.0),
                            decoration:
                                BoxDecoration(border: Border.all(width: 1.0)),
                          ),
                        ),
                        Text(productModel.quantity.toString()),
                        InkWell(
                          onTap: () => ref
                              .read(cartProvider.notifier)
                              .addToCart(productModel),
                          child: Container(
                            child: Text(
                              "+",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            margin: EdgeInsets.symmetric(horizontal: 12.0),
                            decoration:
                                BoxDecoration(border: Border.all(width: 1.0)),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '$kNairaSymbol ${productModel.getPrice}',
                      style: TextStyle(
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

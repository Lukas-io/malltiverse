import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:malltiverse/model/cart_model.dart';
import 'package:malltiverse/view/widget/history_item.dart';

import '../../config/constants.dart';

class CartHistoryScreen extends StatelessWidget {
  const CartHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box<CartModel>('cart').listenable(),
        builder: (context, Box<CartModel> box, _) {
          return CustomScrollView(slivers: [
            SliverAppBar(
              leadingWidth: 108.0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Image.asset(
                  pLogo,
                  fit: BoxFit.fitWidth,
                ),
              ),
              title: const Text(
                "My Order History",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            box.length == 0
                ? const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        "No Purchase Made",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20.0),
                      ),
                    ),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                          List.generate(box.length, (index) {
                        final cart = box.getAt(box.length - index - 1);
                        return HistoryItem(
                            productItems: cart!.cartItems, dateTime: cart.date);
                      })),
                    ),
                  ),
          ]);
        });
  }
}

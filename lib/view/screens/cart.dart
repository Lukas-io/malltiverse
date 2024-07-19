import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:malltiverse/view/screens/checkout.dart';
import 'package:malltiverse/view/widget/cart_item.dart';

import '../../config/constants.dart';
import '../../providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final totalAmount = ref.read(cartProvider.notifier).totalAmount;

    if (cartItems.isNotEmpty) {
      return CustomScrollView(
        slivers: [
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
              "My Cart",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(cartItems.length, (index) {
                return CartItem(productModel: cartItems[index]);
              }),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 80.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 16.0),
                margin: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 16.0),
                decoration: BoxDecoration(
                    color: const Color(0XFFEDEDED).withOpacity(0.67)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Shopping Summary",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    const Text("Discount Code"),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40.0,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(42, 42, 42, 0.7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.0))),
                              backgroundColor:
                                  WidgetStateProperty.all(kPrimaryColor)),
                          child: const Text(
                            "Apply",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Sub-Total"),
                        Text(
                          '$kNairaSymbol ${totalAmount.toInt().toString().splitMapJoin(
                                RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
                                onMatch: (match) => '${match[1]},',
                                onNonMatch: (nonMatch) => nonMatch,
                              )}',
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery Fee"),
                        Text(
                          '$kNairaSymbol 1,500',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: CustomPaint(
                        painter: DashedLinePainter(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total Amount"),
                          Text(
                            '$kNairaSymbol ${(totalAmount.toInt() + 1500).toString().splitMapJoin(
                                  RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
                                  onMatch: (match) => '${match[1]},',
                                  onNonMatch: (nonMatch) => nonMatch,
                                )}',
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 16.0),
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const CheckoutScreen(),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return SafeArea(
        child: CustomScrollView(
      slivers: [
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
            "My Cart",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        const SliverFillRemaining(
          child: Center(
            child: Text(
              "No Item In The Cart",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
            ),
          ),
        ),
      ],
    ));
  }
}

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;

  DashedLinePainter({
    this.dashWidth = 9.0,
    this.dashSpace = 7.0,
    this.color = Colors.black26,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    double startX = 0.0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

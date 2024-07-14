import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:malltiverse/config/constants.dart';
import 'package:malltiverse/view/screens/successful.dart';

import '../../providers/cart_provider.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 230,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromRGBO(42, 42, 42, 0.95),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Text(
                            'VISA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        '5047 1245 7689 2345',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Card holder name',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Hafsat Ardo',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 36),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expiry date',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '02/30',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(pESim),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Positioned(
                  top: -54,
                  left: 169,
                  child: Container(
                    height: 158,
                    width: 158,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(.25),
                      shape: const CircleBorder(),
                    ),
                  ),
                ),
                Positioned(
                  top: -10,
                  left: 240,
                  child: Container(
                    height: 158,
                    width: 158,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(.25),
                      shape: const CircleBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 34),
            const Text('Card Number'),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                hintText: '0000 0000 0000 0000',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color.fromRGBO(42, 42, 42, 0.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(151, 151, 151, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Expiry Date'),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'mm/yy',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color.fromRGBO(42, 42, 42, 0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(151, 151, 151, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('CVV'),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '123',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color.fromRGBO(42, 42, 42, 0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(151, 151, 151, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(cartProvider.notifier).clearCart();
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => SuccessScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Make Payment',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

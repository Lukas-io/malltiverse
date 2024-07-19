import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:malltiverse/config/constants.dart';
import 'package:malltiverse/view/screens/cart.dart';
import 'package:malltiverse/view/screens/cart_history.dart';
import 'package:malltiverse/view/screens/product_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> tabs = [
    const ProductListScreen(),
    const CartHistoryScreen(),
    const CartScreen()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        tabs[_currentIndex],
        Align(alignment: Alignment.bottomCenter, child: _customNavigationBar())
      ])),
    );
  }

  Widget _customNavigationBar() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        height: 60.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Color(0XFF2A2A2A)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: InkResponse(
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                child: _currentIndex == 0
                    ? Image.asset(pHomeActive)
                    : Image.asset(pHomeInactive),
              ),
            ),
            Expanded(
              child: InkResponse(
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                child: _currentIndex == 1
                    ? Image.asset(pCart1Active)
                    : Image.asset(pCart1Inactive),
              ),
            ),
            Expanded(
              child: InkResponse(
                onTap: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                child: _currentIndex == 2
                    ? Image.asset(pCart2Active)
                    : Image.asset(pCart2Inactive),
              ),
            ),
          ],
        ));
  }
}

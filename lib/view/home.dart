import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malltiverse/config/constants.dart';
import 'package:malltiverse/view/screens/cart.dart';
import 'package:malltiverse/view/screens/product_list.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> tabs = [ProductListScreen(), SizedBox(), CartScreen()];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _customNavigationBar(),
      body: SafeArea(child: tabs[_currentIndex]),
    );
  }

  _customNavigationBar() {
    return Container(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: ClipRRect(
        clipper: CustomRRectClipper(),
        borderRadius: BorderRadius.circular(16.0),
        child: ClipRRect(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Color(0XFF2A2A2A),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            iconSize: 30.0,
            items: [
              BottomNavigationBarItem(
                  label: "",
                  icon: ImageIcon(Image.asset(pHomeInactive).image),
                  // activeIcon: ImageIcon(Image.asset(pHomeActive).image),
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                label: "",
                icon: ImageIcon(Image.asset(pCart1Inactive).image),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: ImageIcon(Image.asset(pCart2Inactive).image),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRRectClipper extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    return RRect.fromRectAndRadius(
      Rect.fromLTRB(0, 0, size.width, size.height - 36.0),
      const Radius.circular(12.0), // You can adjust this for rounded corners
    );
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) {
    return true;
  }
}

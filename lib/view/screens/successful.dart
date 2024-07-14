import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../home.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
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
          ),
          SliverFillRemaining(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset(pConfetti).image, fit: BoxFit.fill)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 200.0, top: 24.0),
                    child: Text(
                      "Payment Successful",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 22.0),
                    ),
                  ),
                  Image.asset(pSuccessful),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Text(
                      "Payment Successful",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18.0),
                    ),
                  ),
                  Text(
                    "Thanks for your purchase",
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

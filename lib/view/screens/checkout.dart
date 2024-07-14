import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malltiverse/config/constants.dart';
import 'package:malltiverse/view/screens/payment.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
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
            "Checkout",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select how to receive your package(s)',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Pickup',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                RadioListTile<String>(
                  activeColor: kPrimaryColor,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Old Secretariat Complex, Area q, Garki Abaji Abji',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromRGBO(42, 42, 42, 0.5),
                      fontSize: 12,
                    ),
                  ),
                  value: 'Option 1',
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  activeColor: kPrimaryColor,
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Sokoto Streen, Area q, Garki Area 1 AMAC',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromRGBO(42, 42, 42, 0.5),
                      fontSize: 12,
                    ),
                  ),
                  value: 'Option 2',
                  groupValue: _selectedValue,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value!;
                    });
                  },
                ),
                const SizedBox(height: 12),
                const Text(
                  'Delivery',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: 260,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contact',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 38.83,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Phone nos 1',
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 40.0,
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: 'Phone nos 1',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  padding: const EdgeInsets.symmetric(horizontal: 36.5),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => PaymentScreen())),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Go to Payment',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 150),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

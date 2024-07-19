import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:malltiverse/config/constants.dart';
import 'package:malltiverse/model/cart_model.dart';
import 'package:malltiverse/model/product_model.dart';
import 'package:malltiverse/view/home.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(CartModelAdapter());

  await Hive.openBox<CartModel>('cart');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Malltiverse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          fontFamily: 'Monserrat',
          useMaterial3: true,
          primaryColor: kPrimaryColor,
          appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              backgroundColor: Colors.transparent)),
      home: const Home(),
    );
  }
}

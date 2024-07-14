import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../controller/controller.dart';
import '../../model/category_model.dart';
import '../../model/product_model.dart';
import 'network_error.dart';
import '../widget/category.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductController controller = ProductController();

  @override
  Widget build(BuildContext context) {
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
            "Product List",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.sizeOf(context).width, 230.0),
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
              height: 200.0,
              padding: const EdgeInsets.all(12.0),
              width: MediaQuery.sizeOf(context).width,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    fit: BoxFit.fill, image: Image.asset(pBackground).image),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Premium Sound,\nPremium Savings",
                    style: TextStyle(
                        color: kBackgroundColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "Limited offer, hope on and get yours now",
                      style: TextStyle(
                          color: kBackgroundColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: FutureBuilder<List<ProductModel>>(
            future: controller.fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: CupertinoColors
                          .systemOrange.highContrastElevatedColor,
                    ),
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(
                    child: NetworkError(
                  error: snapshot.error.toString(),
                  onTryAgain: () {
                    setState(() {
                      controller.fetchProducts();
                    });
                  },
                ));
              }
              if (!snapshot.hasData && snapshot.data!.isEmpty) {
                return const Center(
                  child: Text(
                      "Apologies, No available products today \n Come back tomorrow"),
                );
              }
              CategoryModel categoryModel =
                  CategoryModel(allProducts: snapshot.data!);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Category(
                    title: 'Tech Gadget',
                    categoryList: categoryModel.techGadgets,
                  ),
                  Category(
                    title: 'Men\'s Fashion',
                    categoryList: categoryModel.menFashion,
                  ),
                  Category(
                    title: 'Women\'s Fashion',
                    categoryList: categoryModel.womenFashion,
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

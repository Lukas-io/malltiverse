import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malltiverse/config/constants.dart';
import 'package:malltiverse/view/widget/product_item.dart';

import '../../model/product_model.dart';

class Category extends StatefulWidget {
  final String title;
  final List<ProductModel> categoryList;

  const Category({
    super.key,
    required this.title,
    required this.categoryList,
  });

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final PageController _controller = PageController(viewportFraction: 0.5);

  int _currentPage = 0;
  int pageIndicatorCurrent = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 400.0,
          child: PageView.builder(
            padEnds: false,
            onPageChanged: (page) {
              setState(() {
                if (page.isOdd && page > _currentPage) {
                  _controller.animateToPage(page + 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                } else if (page < _currentPage && page.isOdd) {
                  _controller.animateToPage(page - 1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                }
                _currentPage = page;
                pageIndicatorCurrent = (page / 2).floor();
              });
            },
            controller: _controller,
            itemBuilder: (context, index) {
              return ProductItem(productModel: widget.categoryList[index]);
            },
            itemCount: widget.categoryList.length,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: ShapeDecoration(
                  shape: OvalBorder(
                      side: BorderSide(
                          width: 1.0,
                          color: pageIndicatorCurrent != 0
                              ? Color(0XFFBBBBBB)
                              : Colors.transparent)),
                  color: pageIndicatorCurrent != 0
                      ? Colors.transparent
                      : kPrimaryColor),
              height: 12.0,
              width: 12.0,
            ),
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: ShapeDecoration(
                  shape: OvalBorder(
                      side: BorderSide(
                          width: 1.0,
                          color: pageIndicatorCurrent != 1
                              ? Color(0XFFBBBBBB)
                              : Colors.transparent)),
                  color: pageIndicatorCurrent != 1
                      ? Colors.transparent
                      : kPrimaryColor),
              height: 12.0,
              width: 12.0,
            ),
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: ShapeDecoration(
                  shape: OvalBorder(
                      side: BorderSide(
                          width: 1.0,
                          color: pageIndicatorCurrent != 2
                              ? Color(0XFFBBBBBB)
                              : Colors.transparent)),
                  color: pageIndicatorCurrent != 2
                      ? Colors.transparent
                      : kPrimaryColor),
              height: 12.0,
              width: 12.0,
            ),
          ],
        )
      ],
    );
  }
}

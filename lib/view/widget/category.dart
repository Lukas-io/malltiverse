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
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
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
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                } else if (page < _currentPage && page.isOdd) {
                  _controller.animateToPage(page - 1,
                      duration: const Duration(milliseconds: 300),
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
          children: List.generate(widget.categoryList.length ~/ 2, (index) {
            return _Indicator(
              pageIndicatorCurrent: pageIndicatorCurrent,
              position: index,
            );
          }),
        )
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator(
      {super.key, required this.pageIndicatorCurrent, required this.position});

  final int pageIndicatorCurrent;
  final int position;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: ShapeDecoration(
          shape: OvalBorder(
              side: BorderSide(
                  width: 1.0,
                  color: pageIndicatorCurrent != position
                      ? const Color(0XFFBBBBBB)
                      : Colors.transparent)),
          color: pageIndicatorCurrent != position
              ? Colors.transparent
              : kPrimaryColor),
      height: 12.0,
      width: 12.0,
    );
  }
}

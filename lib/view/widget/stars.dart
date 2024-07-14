import 'package:flutter/cupertino.dart';
import 'package:malltiverse/config/constants.dart';

class Stars extends StatelessWidget {
  final int stars;
  final double? size;
  final Color? color;

  Stars(
      {super.key,
      required this.stars,
      this.size = 24.0,
      this.color = kStarColor});

  @override
  Widget build(BuildContext context) {
    int starCount = 0;

    return Row(
      children: List.generate(5, (int) {
        if (starCount < stars) {
          starCount++;
          return Icon(
            CupertinoIcons.star_fill,
            color: color,
            size: size,
          );
        } else {
          starCount++;
          return Icon(
            CupertinoIcons.star,
            color: color,
            size: size,
          );
        }
      }),
    );
  }
}

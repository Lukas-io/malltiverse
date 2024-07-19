import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../model/product_model.dart';
import '../screens/history_detail.dart';

class HistoryItem extends StatelessWidget {
  final List<ProductModel> productItems;
  final DateTime dateTime;
  final String status;

  const HistoryItem(
      {super.key,
      required this.productItems,
      required this.dateTime,
      this.status = "COMPLETED"});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(productItems.length, (index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => HistoryDetailScreen(
                          productItem: productItems[index],
                          dateTime: dateTime,
                        )));
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            margin:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.fromBorderSide(
                BorderSide(
                    width: 0.3,
                    color: const Color(0XFF2A2A2A).withOpacity(0.4)),
              ),
            ),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: productItems[index].imageUrl,
                  width: 100.0,
                  height: 100.0,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productItems[index].name.split(":")[1],
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  status,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        getDate(dateTime),
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

String getDate(DateTime date) {
  String productDate;
  String month = "";

  switch (date.month) {
    case 1:
      month = "Jan";
      break;
    case 2:
      month = "Feb";
      break;
    case 3:
      month = "Mar";
      break;
    case 4:
      month = "Apr";
      break;
    case 5:
      month = "May";
      break;
    case 6:
      month = "Jun";
      break;
    case 7:
      month = "Jul";
      break;
    case 8:
      month = "Aug";
      break;
    case 9:
      month = "Sep";
      break;
    case 10:
      month = "Oct";
      break;
    case 11:
      month = "Nov";
      break;
    case 12:
      month = "Dec";
      break;
  }

  productDate = '${date.day} $month, ${date.year}';

  return productDate;
}

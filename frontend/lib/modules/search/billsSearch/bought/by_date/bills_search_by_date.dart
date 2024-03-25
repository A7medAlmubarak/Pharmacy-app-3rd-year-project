import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../config/constant.dart';

import './bills_search_by_date_controller.dart';

import '../../../../../config/user_info.dart';

class BuyBillsSearchByDate extends StatelessWidget {
  BuyBillsSearchByDateController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "from:${DateFormat.yMd().format(userInformation.search_bill_date_from)}" +
                "\n" +
                "to :${DateFormat.yMd().format(userInformation.search_bill_date_to)}",
            style: TextStyle(color: white),
          ),
          backgroundColor: appbarcolor,
        ),
        backgroundColor: background,
        body: Obx(() {
          if (controller.isBuyLoading.isTrue) {
            return Center(
              child: CircularProgressIndicator(
                color: six,
              ),
            );
          }
          return ListView.builder(
              itemCount: controller.buyBillsList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        userInformation.select_buybill_id =
                            controller.buyBillsList[index].id;
                        Get.toNamed('/BuyBillInfo');
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'Bill number : ' +
                                  "#" +
                                  controller.buyBillsList[index].id.toString(),
                              style: TextStyle(color: xanadu)),
                          Text(
                              'Date : ' +
                                  DateFormat.yMMMd().format(
                                      controller.buyBillsList[index].date),
                              style: TextStyle(color: textcolor)),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Bought From : " +
                              controller.buyBillsList[index].distributor),
                          Text("Total price : " +'\$'+
                              controller.buyBillsList[index].totalBuyPrice
                                  .toString()),
                        ],
                      ),
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}

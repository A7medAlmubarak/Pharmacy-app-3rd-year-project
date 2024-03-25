import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../config/constant.dart';

import './bills_search_by_number_controller.dart';

import '../../../../../config/user_info.dart';

class BuyBillsSearchByNumber extends StatelessWidget {
  BuyBillsSearchByNumberController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          userInformation.Search_Bill_ID.toString(),
          style: TextStyle(color: white),
        ),
        backgroundColor: appbarcolor,
      ),
      backgroundColor: background,
      body:  Obx(() {
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
                    onTap: () {userInformation.select_buybill_id = controller.buyBillsList[index].id;
                    Get.toNamed('/BuyBillInfo');},
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Bill number : ' +"#"+
                            controller.buyBillsList[index].id.toString(),style: TextStyle(color: xanadu)),
                        Text('Date : ' +
                            DateFormat.yMMMd().format(
                                controller.buyBillsList[index].date),style: TextStyle(color: textcolor)),
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
    );
  }
}

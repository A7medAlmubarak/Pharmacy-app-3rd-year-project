import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../config/constant.dart';

import './bills_search_by_employee_controller.dart';


import '../../../../../config/user_info.dart';

class BillsSearchByEmployee extends StatelessWidget {
  BillsSearchByEmployeeController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          userInformation.Sell_bill_search_by_employee_name,
          style: TextStyle(color: white),
        ),

        backgroundColor: appbarcolor,

      ),

      backgroundColor: background,
      body: Obx(
            () {
          if (controller.isSellLoading.isTrue) {
            return Center(
              child: CircularProgressIndicator(
                color: six,
              ),
            );
          }
          return ListView.builder(
            itemCount: controller.sellBillsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      userInformation.select_sellbill_id = controller.sellBillsList[index].id;
                      print(userInformation.select_sellbill_id);
                      Get.toNamed('/SellBillInfo');
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Bill number : ' +
                            controller.sellBillsList[index].id
                                .toString(),style: TextStyle(color: xanadu)),
                        Text('Date : ' +
                            DateFormat.yMMMd().format(
                                controller.sellBillsList[index].date),style: TextStyle(color: textcolor)),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sold by: " +
                            controller.sellBillsList[index].user),
                        Text("total price: " +'\$'+
                            controller.sellBillsList[index].totalSellPrice
                                .toString()),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}



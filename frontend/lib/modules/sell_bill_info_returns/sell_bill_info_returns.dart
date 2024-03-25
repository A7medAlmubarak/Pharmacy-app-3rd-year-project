
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:pharma_project/config/constant.dart';

import 'dart:io';


import 'package:pharma_project/modules/Sell_Bill_info/sell_bill_info_controller.dart';
import 'package:pharma_project/modules/sell_bill_info_returns/sell_bill_info_returns_controller.dart';

class SellBillInfoReturns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SellBillInfoReturnsController controller = Get.find();
    SellBillInfoController controller2 = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
            child: Text(
              'print',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
        title: Text('Returns'),
      ),backgroundColor: background,
      body: SafeArea(
        child: Obx(
          () {
            if (controller2.returns.value == 0) {
              return Center(
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/ReturnCart');
                      },
                      child: Text(
                        'Add a Return Transition',
                        style: TextStyle(
                          color: xanadu,
                          fontSize: 23,
                        ),
                      )));
            } else {
              return Obx(() {
                if (controller.isloading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: six,
                    ),
                  );
                }

                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'New Total : ',
                          style: TextStyle(fontSize: 25, color: xanadu),
                        ),
                        Text('\$'+
                          controller.billreturns!.bill.updatedTotalPrice
                              .toString(),
                          style: TextStyle(fontSize: 25, color: textcolor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: silver,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          margin: EdgeInsets.zero,

                          height: MediaQuery.of(context).size.height * .4,
                          width: MediaQuery.of(context).size.width * .9,
                          child: ListView.builder(
                              itemCount: controller.billreturns!.items.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: Colors.blueGrey[100],
                                  child: ListTile(
                                    onTap: () {},
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller
                                              .billreturns!.items[index].med,
                                          style: TextStyle(color: xanadu),
                                        ),
                                        Text(
                                          'quantity :  ' +
                                              controller.billreturns!.items[index]
                                                  .returnItemQuantity
                                                  .toString(),
                                          style: TextStyle(color: xanadu),
                                        ),
                                        Text(
                                          'Price :  ' +'\$'+
                                              controller.billreturns!.items[index]
                                                  .returnItemPrice
                                                  .toString(),
                                          style: TextStyle(color: xanadu),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                  ],
                );
              });
            }
          },
        ),
      ),
    );
  }
}

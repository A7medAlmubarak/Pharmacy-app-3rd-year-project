import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pharma_project/config/constant.dart';
import 'package:pharma_project/config/user_info.dart';
import 'package:pharma_project/modules/Sell_Bill_info/sell_bill_info_controller.dart';
import 'package:intl/intl.dart';





class SellBillInfo extends StatefulWidget {
  @override
  State<SellBillInfo> createState() => _SellBillInfoState();
}

class _SellBillInfoState extends State<SellBillInfo> {
  @override
  Widget build(BuildContext context) {
    SellBillInfoController controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appbarcolor,
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
              child: GestureDetector(
                onTap: (){
                  EasyLoading.showToast('Sorry but we couldnt get it to work..',
                      toastPosition: EasyLoadingToastPosition.center);
                },
                child: Text(
                  'print',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
          title: Text('Bill details'),
        ),backgroundColor: background,
        body: SafeArea(
          child: Obx(() {
            if (controller.isloading.isTrue) {
              return Center(
                child: CircularProgressIndicator(
                  color: six,
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Container(
                    width: 300,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Bill number:',
                                style: TextStyle(fontSize: 25, color: black),
                              ),
                              Text("#"+
                                controller.sellbilldetails!.bill.id.toString(),
                                style: TextStyle(fontSize: 25, color: xanadu),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sold by : ',
                                style: TextStyle(fontSize: 25, color: black),
                              ),
                              Text(
                                controller.sellbilldetails!.bill.user,
                                style: TextStyle(fontSize: 25, color: xanadu),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(fontSize: 25, color: black),
                              ),
                              Text(
                                DateFormat.yMd()
                                    .format(controller.sellbilldetails!.bill.date),
                                style: TextStyle(fontSize: 25, color: xanadu),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Divider(
                      thickness: 2,
                      color: textcolor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(fontSize: 25, color: black),
                        ),
                        Text('\$'+
                          controller.sellbilldetails!.bill.totalSellPrice
                              .toString(),
                          style: TextStyle(fontSize: 25, color: xanadu),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  ClipRRect(borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Container(

                      decoration: BoxDecoration(
                        color: silver,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      margin: EdgeInsets.zero,

                      height: MediaQuery.of(context).size.height * .4,
                      width: MediaQuery.of(context).size.width * .9,
                      child: ListView.builder(
                          itemCount: controller.sellbilldetails!.items.length,
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.blueGrey[100],
                              child: ListTile(
                                onTap: () {},
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.sellbilldetails!.items[index].med,
                                      style: TextStyle(color: textcolor),
                                    ),
                                    Text(
                                      'quantity :  ' +
                                          controller.sellbilldetails!.items[index]
                                              .sellItemQuantity
                                              .toString(),
                                      style: TextStyle(color: textcolor),
                                    ),
                                    Text(
                                      'Price :  ' +'\$'+
                                          controller.sellbilldetails!.items[index]
                                              .sellItemPrice
                                              .toString(),
                                      style: TextStyle(color: textcolor),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  FloatingActionButton.extended(
                      backgroundColor: appbarcolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () {
                        userInformation.select_sellbill_return =
                            controller.sellbilldetails!.returnStatus;
                        Get.toNamed('/SellBillInfoReturns');
                      },
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Returns',
                            style: TextStyle(color: white),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                ],
              ),
            );
          }),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pharma_project/config/constant.dart';

import 'package:intl/intl.dart';

import 'buy_bill_info_controller.dart';

class BuyBillInfo extends StatefulWidget {
  @override
  State<BuyBillInfo> createState() => _BuyBillInfoState();
}

class _BuyBillInfoState extends State<BuyBillInfo> {
  @override
  Widget build(BuildContext context) {
    BuyBillInfoController controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appbarcolor,
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
              child: GestureDetector(
                onTap: () {},
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
            return Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*.02,),
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
                              controller.buybilldetails!.bill.id.toString(),
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
                              'Bought from : ',

                              style: TextStyle(fontSize: 25, color: black),

                            ),
                            Text(
                              controller.buybilldetails!.bill.distributor,
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
                              DateFormat.yMd().format(controller.buybilldetails!.bill.date),
                              style: TextStyle(fontSize: 25, color: xanadu),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(child: Divider(
                  thickness: 2,
                  color: textcolor,
                ),),
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
                        controller.buybilldetails!.bill.totalBuyPrice
                            .toString(),
                        style: TextStyle(fontSize: 25, color: xanadu),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.05,),
                ClipRRect(
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
                        itemCount: controller.buybilldetails!.items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.blueGrey[100],
                            child: ListTile(
                              onTap: () {},
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.buybilldetails!.items[index].med,
                                    style: TextStyle(color: xanadu),
                                  ),
                                  Text(
                                    'quantity :  ' +
                                        controller.buybilldetails!.items[index]
                                            .buyItemQuantity
                                            .toString(),
                                    style: TextStyle(color: xanadu),
                                  ),
                                  Text(
                                    'Price :  ' +'\$'+
                                        controller.buybilldetails!.items[index]
                                            .buyItemPrice
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
                SizedBox(height: MediaQuery.of(context).size.height*.05,),

              ],
            );
          }),
        ));
  }
}

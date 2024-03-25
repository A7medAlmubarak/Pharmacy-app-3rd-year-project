import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../component/cartSelectedList.dart';
import '../../../config/constant.dart';

import '../../../models/newBuyBill.dart';
import '../../../config/constant.dart';
import '../../../component/custom_button.dart';
import '../../../config/user_info.dart';
import 'buyCart_controller.dart';

class BuyCart extends StatefulWidget {
  @override
  State<BuyCart> createState() => _BuyCartState();
}

class _BuyCartState extends State<BuyCart> {
  BuyCartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Cart',
            style: TextStyle(color: white),
          ),
          backgroundColor: appbarcolor,
        ),
        floatingActionButton: FloatingActionButton(backgroundColor:appbarcolor ,
          onPressed: () {
            Get.toNamed("/BuyProductsList");
          },
          child: Icon(Icons.add,color: white,),
        ),backgroundColor: background,
        body: Obx(
          () {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .6,
                    child: ListView.builder(
                        itemCount: controller.p.length,
                        itemBuilder: (ctx, index) {
                          return CartSelectedList(
                            name: controller.p[index].name,
                            price: controller.p[index].price,
                            quantity: controller.p[index].quantity,
                            onedl: () {
                              print("delet" +
                                  "\n" +
                                  controller.p[index].id.toString());
                              setState(() {
                                controller.p[index].id = userInformation.del_id;
                                controller.p.removeWhere((element) {
                                  return element.id == userInformation.del_id;
                                });
                                controller.med.removeWhere((element) {
                                  return element.drugId ==
                                      userInformation.del_id;
                                });
                              });
                            },
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: xanadu,),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Total:",
                              style: TextStyle(fontSize: 20,color: white),
                            ),
                            Text('\$'+
                              total(),
                              style: TextStyle(fontSize: 20,color: white),
                            ),
                          ],
                        ),
                      ),

                      width: 150,
                      height: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                      hight: 60,
                      width: 100,
                      fontsize: 20,
                      buttonColor: appbarcolor,
                      buttonName: "Done",
                      ontap: () {
                        done();
                      },
                      nameColor: white),
                ],
              ),
            );
          },
        ));
  }

  String total() {
    double sum = 0;
    for (product test in controller.p) {
      sum += (test.price * test.quantity);
    }
    return sum.toString();
  }

  void done() async {
    for (product test in controller.p) {
      controller.med.add(Med(
          drugId: test.id,
          quantity: test.quantity.toString(),
          buyItemPrice: test.price.toInt()));
    }
    print(controller.med.length);
    print(controller.med);
    for (Med test in controller.med) {
      print(test.drugId.toString() +
          "    " +
          test.quantity +
          "    " +
          test.buyItemPrice.toString());
    }
    if (controller.med.length != 0) {
      EasyLoading.showToast("Sending....",
          toastPosition: EasyLoadingToastPosition.center);
      await controller.CreateBill();
      if (controller.createState) {
        EasyLoading.showToast(controller.msg,
            toastPosition: EasyLoadingToastPosition.bottom);

        Get.offAllNamed("/Home");
      }
      EasyLoading.showToast(controller.msg,
          dismissOnTap: true, toastPosition: EasyLoadingToastPosition.bottom);
    } else {
      EasyLoading.showToast("Empty cart",
          dismissOnTap: true, toastPosition: EasyLoadingToastPosition.bottom);
    }
  }
}

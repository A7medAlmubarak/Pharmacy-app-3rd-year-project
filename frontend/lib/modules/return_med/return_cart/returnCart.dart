import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pharma_project/modules/return_med/return_cart/returncart_controller.dart';

import '../../../config/constant.dart';
import '../../../component/cartSelectedList.dart';
import '../../../models/newReturn.dart';

import '../../../component/custom_button.dart';
import '../../../config/user_info.dart';

class ReturnCart extends StatefulWidget {
  @override
  State<ReturnCart> createState() => _ReturnCartState();
}

class _ReturnCartState extends State<ReturnCart> {

  ReturnCartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Choose meds to return',
            style: TextStyle(color: white),
          ),
          backgroundColor: appbarcolor,
        ),
        floatingActionButton: FloatingActionButton(backgroundColor: appbarcolor,

          onPressed: () {
            Get.toNamed("/ReturnProductsList");
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
                              print("delet"+"\n"+controller.p[index].id.toString());
                              setState(() {
                                controller.p[index].id = userInformation.del_id;
                                controller.p.removeWhere((element) {
                                  return element.id == userInformation.del_id;
                                });
                                controller.med.removeWhere((element) {
                                  return element.batchId ==
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
                              "Returns total:",
                              style: TextStyle(fontSize: 20,color: white),
                            ),
                            Text('\$'+
                              total(),
                              style: TextStyle(fontSize: 20,color: white),
                            ),
                          ],
                        ),
                      ),

                      width: 200,
                      height: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                      hight: 60,
                      width: 100,
                      buttonColor: appbarcolor,
                      buttonName: "Done",
                      ontap: () {
                        done();
                      },
                      nameColor: white, fontsize: 20,),
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
      controller.med.add(
          Med(batchId: test.id, returnItemQuantity: test.quantity.toString(),sellBellOrderId:userInformation.select_sellbill_id ));
    }
    print(controller.med.length);
    print(controller.med);
    for (Med test in controller.med) {
      print("batch:"+test.batchId.toString() +"    "+ "Qty:" + test.returnItemQuantity);
    }
    if (controller.med.length != 0) {
      EasyLoading.showToast("Sending....",
          toastPosition: EasyLoadingToastPosition.center);
      await controller.CreateBill();
      if (controller.createState) {
        EasyLoading.showToast(controller.msg,
            toastPosition: EasyLoadingToastPosition.bottom);

        Get.offAllNamed("/Bills");
      }
      EasyLoading.showToast(controller.msg, dismissOnTap: true, toastPosition: EasyLoadingToastPosition.bottom);

    }

    else {
      EasyLoading.showToast("No returns noticed !",
          dismissOnTap: true, toastPosition: EasyLoadingToastPosition.bottom);
    }
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pharma_project/modules/return_med/return_product_List/returnProductListController.dart';

import '../../../config/constant.dart';
import '../../../component/Drawer.dart';
import '../../../component/myMedsList.dart';
import '../../../component/cartSelectList.dart';
import '../../../config/user_info.dart';
import '../../../component/custom_button.dart';
import '../../../component/custom_textinput.dart';

class ReturnProductsList extends StatefulWidget {
  @override
  State<ReturnProductsList> createState() => _ReturnProductsListState();
}

class _ReturnProductsListState extends State<ReturnProductsList> {
  ReturnProductsListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Select a Medicin to Add',
          style: TextStyle(color: white),
        ),
        backgroundColor: appbarcolor,
      ),
      backgroundColor: background,
      body: Obx(() {
        if (controller.isloading.isTrue) {
          return Center(
            child: CircularProgressIndicator(
              color: six,
            ),
          );
        }

        return ListView.builder(
            itemCount: controller.sellbilldetails!.items.length,
            itemBuilder: (ctx, index) {
              return CartSelectList(
                name: controller.sellbilldetails?.items[index].med,
                price: controller.sellbilldetails?.items[index].sellItemPrice.toDouble() ,
                ontap: () {},
                addtap: () {
                  Get.defaultDialog(
                      title: "Add Quantity",titleStyle: TextStyle(color: appbarcolor),
                      backgroundColor: background,
                      content: Container(
                        width: 220,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Quantity",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,color: xanadu),
                                ),
                                TextInput(
                                  width: 100,
                                  height: 60,
                                  hintText: "eg.1",
                                  onChange: (value) =>
                                      controller.quantity = value,
                                  color: white,
                                )
                              ],
                            ),
                            Button(
                                hight: 50,
                                width: double.infinity,
                                buttonColor: appbarcolor,
                                buttonName: "Add",
                                ontap: () {
                                  if(int.parse(controller.quantity)<=controller.sellbilldetails!.items[index].sellItemQuantity ) {
                                    controller.add(
                                      controller.sellbilldetails!.items[index]
                                          .batchId,
                                      controller
                                          .sellbilldetails!.items[index].med,
                                        controller
                                            .sellbilldetails!.items[index].sellItemPrice.toDouble(),
                                      int.parse(controller.quantity));
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  }else{
                                    EasyLoading.showToast("added quantity error", dismissOnTap: true, toastPosition: EasyLoadingToastPosition.bottom);

                                  }

                                },
                                nameColor: white, fontsize: 20,)
                          ],
                        ),
                      ));
                },
              );
            });
      }),
    );
  }
}

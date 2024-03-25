import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as sv;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../models/medsList.dart';
//import 'package:pdf/pdf.dart';
//import 'package:pdf/widgets.dart' as pw;
//import 'dart:io';
//import 'package:open_file/open_file.dart';
//import 'package:path_provider/path_provider.dart';

import 'package:get/get.dart';
import './sellProductsList_controller.dart';
import '../../../config/constant.dart';
import '../../../component/Drawer.dart';

import '../../../component/cartSelectList.dart';
import '../../../config/user_info.dart';
import '../../../component/custom_button.dart';
import '../../../component/custom_textinput.dart';

class SellProductsList extends StatefulWidget {
  @override
  State<SellProductsList> createState() => _SellProductsListState();
}

class _SellProductsListState extends State<SellProductsList> {
  SellProductsListController controller = Get.find();

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: appbarcolor,
        onPressed: () {
          scanbarcode();
        },
        child: Icon(
          Icons.qr_code_scanner,
          color: white,
        ),
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
            itemCount: controller.meds.length,
            itemBuilder: (ctx, index) {
              return CartSelectList(
                name: controller.meds[index].name,
                price: controller.meds[index].sellPrice.toDouble(),
                ontap: () {
                  userInformation.select_med_index_quantity =
                      controller.meds[index].storageQuantity;
                  userInformation.select_med_id = controller.meds[index].id;
                  Get.toNamed("/MedInfo");
                },
                addtap: () {
                  print(controller.meds[index].id);
                  Get.defaultDialog(
                      title: "Add Quantity",titleStyle:TextStyle(color:appbarcolor ) ,
                      backgroundColor: white,
                      content: Container(
                        width: 220,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  color: one,
                                )
                              ],
                            ),
                            Button(
                                hight: 50,
                                fontsize: 20,
                                width: double.infinity,
                                buttonColor: appbarcolor,
                                buttonName: "Add",
                                ontap: () {
                                  controller.add(
                                      controller.meds[index].id,
                                      controller.meds[index].name,
                                      controller.meds[index].sellPrice
                                          .toDouble(),
                                      int.parse(controller.quantity));
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Get.offNamed("/SellCart");
                                },
                                nameColor: white)
                          ],
                        ),
                      ));
                },
              );
            });
      }),
    );
  }

  Future scanbarcode() async {
    String scanResult;
    bool found = false;
    String name = "";
    double price = 0.0;
    int id = 0;

    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.DEFAULT);
    } on sv.PlatformException {
      scanResult = "Lol";
    }
    if (!mounted) return;
    print(scanResult);
    if (scanResult != "Null" && scanResult != "-1") {
      for (MedsList M in controller.meds) {
        if (scanResult == M.barcode_number) {
          found = true;
          name = M.name;
          price = M.sellPrice.toDouble() ;
          id = M.id;
        } else {
          found = false;
        }
      }
      if (found) {
        Get.defaultDialog(
          title: scanResult,titleStyle: TextStyle(color: appbarcolor),
          backgroundColor: background,
          content: Container(
            width: 220,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold,color: xanadu),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text('\$'+
                      price.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold,color: xanadu),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextInput(
                      width: 100,
                      height: 60,
                      hintText: "eg.1",
                      onChange: (value) => controller.quantity = value,
                      color: white,
                    )
                  ],
                ),
                Button(
                    hight: 50,
                    fontsize: 20,
                    width: double.infinity,
                    buttonColor: appbarcolor,
                    buttonName: "Add",
                    ontap: () {
                      controller.add(id, name, price,
                          int.parse(controller.quantity));
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Get.offNamed("/SellCart");
                    },
                    nameColor: white)
              ],
            ),
          ),
        );
      } else {
        EasyLoading.showToast("We don't have that Medicine",
            toastPosition: EasyLoadingToastPosition.bottom);
      }
    }
  }


}

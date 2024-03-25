import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as sv;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import './meds_controller.dart';

import '../../config/constant.dart';
import '../../config/user_info.dart';
import '../../component/custom_textinput.dart';
import '../../component/custom_button.dart';
import '../../component/Drawer.dart';
import '../../component/allMedsList.dart';

import '../../models/medicin.dart';

class Meds extends StatelessWidget {
  MedsController controller = Get.find();
  /*List<Medicin> meds = [
    Medicin(Name: "temp1", Quantity: 60, Price: 300),
    Medicin(Name: "temp2", Quantity: 60, Price: 300),
    Medicin(Name: "temp3", Quantity: 60, Price: 300),
    Medicin(Name: "temp4", Quantity: 60, Price: 300),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Meds',
          style: TextStyle(color: white),
        ),
        backgroundColor: appbarcolor,
        actions: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                  icon: Icon(
                    Icons.search_sharp,
                    color: white,
                  ),
                  onPressed: () {
                    Get.bottomSheet(
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          height: 300,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextInput(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .5,
                                        height: 60,
                                        color: white,
                                        hintText: "By name",
                                        onChange: (value) {
                                          userInformation.Search_by_name =
                                              value;
                                        }),
                                    Button(
                                      fontsize: 20,
                                      hight: 50,
                                      width: 150,
                                      buttonColor: appbarcolor,
                                      buttonName: "Search",
                                      nameColor: white,
                                      ontap: () {
                                        if (userInformation.Search_by_name !=
                                            "") {
                                          Navigator.pop(context);
                                          Get.toNamed("/MedsSearchByName");
                                        } else {
                                          EasyLoading.showToast("Empty search",
                                              toastPosition:
                                                  EasyLoadingToastPosition
                                                      .bottom);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextInput(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .5,
                                        height: 60,
                                        color: white,
                                        hintText: "By Scientific Material",
                                        onChange: (value) {
                                          userInformation.Search_by_SN = value;
                                        }),
                                    Button(
                                      fontsize: 20,
                                      hight: 50,
                                      width: 150,
                                      buttonColor: appbarcolor,
                                      buttonName: "Search",
                                      nameColor: white,
                                      ontap: () {
                                        if (userInformation.Search_by_SN !=
                                            "") {
                                          Navigator.pop(context);
                                          Get.toNamed("/MedsSearchBySN");
                                        } else {
                                          EasyLoading.showToast("Empty search",
                                              toastPosition:
                                                  EasyLoadingToastPosition
                                                      .bottom);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: appbarcolor,
                                    ),
                                    height: 75,
                                    width: 75,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.qr_code_scanner,
                                        color: white,
                                      ),
                                      onPressed: () {
                                        scanbarcode(context);
                                      },
                                    )),
                              ],
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        backgroundColor: background);
                  }))
        ],
      ),
      backgroundColor: background,
      drawer: MyDrawer(),
      floatingActionButton: userInformation.user_id_bool
          ? FloatingActionButton(
              onPressed: () {
                Get.toNamed("/Add");
              },
              backgroundColor: appbarcolor,
              child: Icon(
                Icons.add,
                color: white,
              ),
            )
          : Container(),
      body: Obx(() {
        if (controller.isloading.isTrue) {
          return Center(
            child: CircularProgressIndicator(
              color: six,
            ),
          );
        }

        return ListView.builder(
            itemCount: controller.MedsList.length,
            itemBuilder: (ctx, index) {
              return AllMedsList(
                name: controller.MedsList[index].name,
                price: controller.MedsList[index].sellPrice.toDouble(),
                ontap: () {
                  userInformation.select_med_id = controller.MedsList[index].id;
                  // Get.toNamed("/MedInfo");
                  Get.defaultDialog(
                      title: "Medicin Info",
                      titleStyle: TextStyle(color: appbarcolor),
                      backgroundColor: white,
                      content: Container(
                        width: 220,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  controller.MedsList[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: xanadu),
                                )
                              ],
                            ),
                            SizedBox(height: 1),
                            TextButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      content: Card(
                                        elevation: 10,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: BarcodeWidget(
                                              barcode: Barcode
                                                  .code128(), // Barcode type and settings
                                              data: controller.MedsList[index]
                                                  .barcode_number, // Content",
                                              width: 350,
                                              height: 200,
                                              drawText: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                      title: "Barcode",
                                      titleStyle:
                                          TextStyle(color: appbarcolor));
                                },
                                child: Text("Show Barcode",
                                    style: TextStyle(color: xanadu))),
                            SizedBox(height: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Price",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('\$'+
                                  controller.MedsList[index].sellPrice
                                      .toString(),
                                  style:
                                      TextStyle(color: textcolor, fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Scientific",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Material",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text(":", style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                                Text(
                                  controller.MedsList[index].scientificMaterial,
                                  style:
                                      TextStyle(color: textcolor, fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Category:",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  controller.MedsList[index].category,
                                  style:
                                      TextStyle(color: textcolor, fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Company:",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  controller.MedsList[index].company,
                                  style:
                                      TextStyle(color: textcolor, fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            userInformation.user_id_bool
                                ? Button(
                                    hight: 50,
                                    fontsize: 20,
                                    width: double.infinity,
                                    buttonColor: appbarcolor,
                                    buttonName: "Edit",
                                    ontap: () {
                                      userInformation.Edit_name =
                                          controller.MedsList[index].name;
                                      userInformation.Edit_Price = controller
                                          .MedsList[index].sellPrice
                                          .toString();
                                      userInformation.Edit_Cat =
                                          controller.MedsList[index].category;
                                      userInformation.Edit_S_M = controller
                                          .MedsList[index].scientificMaterial;
                                      userInformation.Edit_Company =
                                          controller.MedsList[index].company;
                                      userInformation.Edit_id =
                                          controller.MedsList[index].id;
                                      Get.toNamed("/Edit");
                                    },
                                    nameColor: white)
                                : Container(),
                          ],
                        ),
                      ));
                },
              );
            });
      }),
    );
  }

  Future scanbarcode(contex) async {
    String scanResult;

    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.DEFAULT);
    } on sv.PlatformException {
      scanResult = "Lol";
    }
    //if (!mounted) return;
    print(scanResult);
    if (scanResult != "Null" && scanResult != "-1") {
      userInformation.Search_by_Barcode = scanResult;
      Navigator.pop(contex);
      Get.toNamed("/MedsSearchByBarcode");
    }
  }
}

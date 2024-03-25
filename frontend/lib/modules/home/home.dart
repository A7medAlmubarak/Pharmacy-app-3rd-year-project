import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' as sv;
import './home_controller.dart';

import '../../config/constant.dart';
import '../../config/user_info.dart';
import '../../component/custom_textinput.dart';
import '../../component/custom_button.dart';
import '../../component/Drawer.dart';
import '../../component/myMedsList.dart';

import '../../models/medicin.dart';

class Home extends StatelessWidget {
  HomeController controller = Get.find();
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
          'welcome',
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextInput(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    height: 60,
                                    color: white,
                                    hintText: "By name",
                                    onChange: (value) {
                                      userInformation.Search_by_name = value;
                                    }),
                                Button(
                                  fontsize: 20,
                                  hight: 50,
                                  width: 150,
                                  buttonColor: appbarcolor,
                                  buttonName: "Search",
                                  nameColor: white,
                                  ontap: () {
                                    if (userInformation.Search_by_name != "") {
                                      Navigator.pop(context);
                                      Get.toNamed("/HomeSearchByName");
                                    } else {
                                      EasyLoading.showToast("Empty search",
                                          toastPosition:
                                              EasyLoadingToastPosition.bottom);
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextInput(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
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
                                    if (userInformation.Search_by_SN != "") {
                                      Navigator.pop(context);
                                      Get.toNamed("/HomeSearchBySN");
                                    } else {
                                      EasyLoading.showToast("Empty search",
                                          toastPosition:
                                              EasyLoadingToastPosition.bottom);
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
              },
            ),
          ),
        ],
      ),
      backgroundColor: background,
      drawer: MyDrawer(),
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
              return MedsList(
                name: controller.meds[index].name,
                quantity: controller.meds[index].storageQuantity,
                price: controller.meds[index].sellPrice.toDouble(),
                ontap: () {
                  userInformation.select_med_index_quantity =
                      controller.meds[index].storageQuantity;
                  userInformation.select_med_id = controller.meds[index].id;
                  Get.toNamed("/MedInfo");
                },
              );
            });
      }),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: appbarcolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            Get.toNamed("/SellCart");
          },
          label: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'New transaction',
                style: TextStyle(color: white),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.add,
                color: white,
              ),
            ],
          )),
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
      Get.toNamed("/HomeSearchByBarcode");
    }
  }
}

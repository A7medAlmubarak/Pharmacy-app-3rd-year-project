import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as sv;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import './buyProductsList_controller.dart';
import '../../../config/constant.dart';
import '../../../component/Drawer.dart';
import '../../../models/medsIndex.dart';
import '../../../component/cartBuySelectList.dart';
import '../../../config/user_info.dart';
import '../../../component/custom_button.dart';
import '../../../component/custom_textinput.dart';

class BuyProductsList extends StatefulWidget {
  @override
  State<BuyProductsList> createState() => _BuyProductsListState();
}

class _BuyProductsListState extends State<BuyProductsList> {
  BuyProductsListController controller = Get.find();

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
      floatingActionButton: FloatingActionButton(backgroundColor: appbarcolor,
        onPressed: () {
          scanbarcode();
        },
        child: Icon(Icons.qr_code_scanner,color: white,),
      ),backgroundColor: background,
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
              return SingleChildScrollView(
                child: CartBuySelectList(
                  name: controller.meds[index].name,
                  ontap: () {
                    Get.defaultDialog(
                        title: "Medicin Info",titleStyle:TextStyle(color:appbarcolor ) ,
                        backgroundColor: white,
                        content: Container(
                          width: 220,
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  Text(
                                    controller.meds[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,color: xanadu),
                                  )
                                ],
                              ),
                              SizedBox(height: 1),
                              TextButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                        content: Card(elevation: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: BarcodeWidget(
                                                barcode: Barcode
                                                    .code128(), // Barcode type and settings
                                                data:
                                                controller.meds[index].barcode_number, // Content",
                                                width: 350,
                                                height: 200,
                                                drawText: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                        title: "Barcode",
                                        titleStyle:TextStyle(color:appbarcolor )
                                    );
                                  },
                                  child: Text("Show Barcode",
                                      style: TextStyle(color: xanadu))),
                              SizedBox(height: 1),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Price",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,),
                                  ),
                                  Text('\$'+controller.meds[index].sellPrice.toString(),style: TextStyle(color: textcolor,fontSize: 15),)
                                ],
                              ),SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                  Text(controller.meds[index].scientificMaterial,style: TextStyle(color: textcolor,fontSize: 15),)
                                ],
                              ),SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Category:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(controller.meds[index].category,style: TextStyle(color: textcolor,fontSize: 15),)
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Company:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(controller.meds[index].company,style: TextStyle(color: textcolor,fontSize: 15),)
                                ],
                              ),

                              SizedBox(height: 10),

                            ],
                          ),
                        ));

                  },
                  addtap: () {
                    print(controller.meds[index].id);
                    Get.defaultDialog(
                        title: "Complete info",
                        titleStyle: TextStyle(color: appbarcolor),
                        backgroundColor: white,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Buy Price",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,color: xanadu),
                                  ),
                                  TextInput(
                                    width: 100,
                                    height: 60,
                                    hintText: "eg.1",
                                    onChange: (value) =>
                                        controller.price = value,
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
                                    controller.add(
                                        controller.meds[index].id,
                                        controller.meds[index].name,
                                        double.parse(controller.price),
                                        int.parse(controller.quantity));
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  nameColor: white)
                            ],
                          ),
                        ));
                  },
                ),
              );
            });
      }),
    );
  }

  Future scanbarcode() async {
    String scanResult;
    bool found=false;
    String name="";
    int id=0;


    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "cancel", true, ScanMode.DEFAULT);
    } on sv.PlatformException {
      scanResult = "Lol";
    }
    if (!mounted) return;
    print("barcode: "+scanResult);
    if (scanResult != "Null" && scanResult != "-1") {
      for (Med M in controller.meds) {
        if (scanResult == M.barcode_number) {
          found=true;
          name=M.name;
          id=M.id;
          break;
        }else{found=false;}
      }
      if (found) {
        Get.defaultDialog(
          title: "Complete Info",
          backgroundColor: white,
          titleStyle: TextStyle(color: appbarcolor),
          content: Container(
            width: 220,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,color: xanadu),
                    ),
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold,color: silver),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Buy Price",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,color: xanadu),
                    ),
                    TextInput(
                      width: 100,
                      height: 60,
                      hintText: "eg.1",
                      onChange: (value) =>
                      controller.price = value,
                      color: white,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,color: xanadu),
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
                      controller.add(id, name, double.parse(controller.price),
                          int.parse(controller.quantity));
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Get.offNamed("/BuyCart");
                    },
                    nameColor: white)
              ],
            ),
          ),
        );

      }else {
        EasyLoading.showToast("We don't have that Medicine",
            toastPosition: EasyLoadingToastPosition.bottom);
      }
    }
  }
}

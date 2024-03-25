import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma_project/config/constant.dart';
import 'package:pharma_project/config/user_info.dart';
import './medicin_info_controller.dart';
import '../../models/dumlist.dart';
import '../../component/batchList.dart';
import 'package:barcode_widget/barcode_widget.dart';

class MedInfo extends StatelessWidget {
  MedInfoController Controller = Get.find();

  List<batchlist> test = [
    batchlist(No: 30, Expdate: DateTime.now()),
    batchlist(No: 30, Expdate: DateTime.now()),
    batchlist(No: 30, Expdate: DateTime.now()),
    batchlist(No: 30, Expdate: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Medicin Info',
            style: TextStyle(color: white),
          ),
          backgroundColor: appbarcolor),
      backgroundColor: background,
      body: Obx(
        () {
          if (Controller.isloading.isTrue) {
            return Center(
              child: CircularProgressIndicator(
                color: six,
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(width: 340,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Medicin Name:",
                          style: TextStyle(color: black, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(Controller.medicinInfo!.name,
                            style: TextStyle(fontSize: 35, color: xanadu)),
                        TextButton(
                          onPressed: () {
                            Get.defaultDialog(
                              content: Column(
                                children: [
                                  Card(
                                    elevation: 10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: BarcodeWidget(
                                          barcode: Barcode
                                              .code128(), // Barcode type and settings
                                          data: Controller
                                              .medicinInfo!.barcode_number, // Content",
                                          width: 350,
                                          height: 200,
                                          drawText: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text("barcode Number:  ${Controller
                                      .medicinInfo!.barcode_number} ")
                                ],
                              ),
                              title: "Barcode",
                            );
                          },
                          child: Text(
                            "Show Barcode",
                            style: TextStyle(color: xanadu),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),///////////
                        Row(
                          children: [
                            Text("Scientific Material:",
                                style: TextStyle(color: black, fontSize: 25)),
                            Text(Controller.medicinInfo!.scientificMaterial,
                                style: TextStyle(
                                    fontSize: 25, color: textcolor)), ////////////
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("category:",
                                style: TextStyle(color: black, fontSize: 25)),
                            Text(Controller.medicinInfo!.category,
                                style:
                                    TextStyle(fontSize: 25, color: textcolor)), ////////
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Company:",
                                style: TextStyle(color: black, fontSize: 25)),
                            Text(Controller.medicinInfo!.company,
                                style:
                                    TextStyle(fontSize: 25, color: textcolor)), ////////
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("Price:",
                                    style: TextStyle(color: black, fontSize: 25)),
                                Text('\$'+Controller.medicinInfo!.sellPrice.toString(),
                                    style: TextStyle(fontSize: 25, color: textcolor)),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Quantity:",
                                    style: TextStyle(color: black, fontSize: 25)),
                                Text(
                                    userInformation.select_med_index_quantity
                                        .toString(),
                                    style: TextStyle(fontSize: 25, color: textcolor)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: silver,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    height: 300,
                    width: MediaQuery.of(context).size.height * .50,
                    child: ListView.builder(
                      itemCount: Controller.medicinInfo!.batchs.length,
                      itemBuilder: (ctx, index) {
                        return Batchlist(
                            No: Controller
                                .medicinInfo!.batchs[index].batchQuantity
                                .toDouble(),
                            Expdate: Controller
                                .medicinInfo!.batchs[index].expiredDate);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

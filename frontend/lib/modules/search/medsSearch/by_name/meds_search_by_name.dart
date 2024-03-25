import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/component/allMedsList.dart';
import './meds_search_by_name_controller.dart';
import '../../../../config/constant.dart';
import '../../../../config/user_info.dart';

class MedsSearchByName extends StatelessWidget {

  MedsSearchByNameController controller= Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          userInformation.Search_by_name,
          style: TextStyle(color: white),
        ),
        backgroundColor: appbarcolor,

      ),
      backgroundColor: background,

      body:Obx(() {
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
                  userInformation.select_med_id =
                      controller.MedsList[index].id;
                  // Get.toNamed("/MedInfo");
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
                                  controller.MedsList[index].name,
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
                                              controller.MedsList[index].barcode_number, // Content",
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
                                Text(controller.MedsList[index].sellPrice.toString(),style: TextStyle(color: textcolor,fontSize: 15),)
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
                                Text(controller.MedsList[index].scientificMaterial,style: TextStyle(color: textcolor,fontSize: 15),)
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
                                Text(controller.MedsList[index].category,style: TextStyle(color: textcolor,fontSize: 15),)
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
                                Text(controller.MedsList[index].company,style: TextStyle(color: textcolor,fontSize: 15),)
                              ],
                            ),

                            SizedBox(height: 10),


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

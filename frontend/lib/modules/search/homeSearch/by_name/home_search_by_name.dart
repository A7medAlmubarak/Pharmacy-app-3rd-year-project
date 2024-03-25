import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../component/myMedsList.dart';
import './home_search_by_name_controller.dart';
import '../../../../config/constant.dart';
import '../../../../config/user_info.dart';

class HomeSearchByName extends StatelessWidget {

  HomeSearchByNameController controller= Get.find();

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

    );
  }
}

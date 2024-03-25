import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../config/constant.dart';

import './add_supplier_controller.dart';

import '../../component/custom_button.dart';
import '../../component/custom_textinput.dart';

class AddSupplier extends StatelessWidget {
  AddSupplierController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Add a New Supplier',
            style: TextStyle(color: white),
          ),
          backgroundColor: appbarcolor,
        ),backgroundColor: background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextInput(
                height: 40,
                width: MediaQuery.of(context).size.width,
                onChange: (value) => controller.name = value,
                hintText: "Name",
              ),
              SizedBox(
                height: 20,
              ),
              TextInput(
                height: 40,
                width: MediaQuery.of(context).size.width,
                onChange: (value) => controller.email = value,
                hintText: "Email",
              ),
              SizedBox(
                height: 20,
              ),
              TextInput(
                height: 40,
                width: MediaQuery.of(context).size.width,
                onChange: (value) => controller.phone = value,
                hintText: "Phone",
              ),
              SizedBox(
                height: 20,
              ),
              TextInput(
                height: 40,
                width: MediaQuery.of(context).size.width,
                onChange: (value) => controller.location = value,
                hintText: "Location",
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                hight: 40,
                width: MediaQuery.of(context).size.width*.3,
                buttonColor: appbarcolor,
                buttonName: "Add",
                nameColor: white,
                fontsize: 20,
                ontap: () {
                  addClick();
                },
              )
            ],
          ),
        ));
  }

  void addClick() async {
    print(controller.name +
        "\n" +
        controller.email +
        "\n" +
        controller.phone +
        "\n" +
        controller.location);
    EasyLoading.showToast("Addnig....",
        toastPosition: EasyLoadingToastPosition.center);
    await controller.addSupplier();
    if (controller.addstate) {
      EasyLoading.showToast(controller.msg,
          toastPosition: EasyLoadingToastPosition.bottom);

      Get.offAllNamed("/Suppliers");
    }
    EasyLoading.showToast(controller.msg+"\n"+controller.error,
        dismissOnTap: true, toastPosition: EasyLoadingToastPosition.bottom);
  }
}

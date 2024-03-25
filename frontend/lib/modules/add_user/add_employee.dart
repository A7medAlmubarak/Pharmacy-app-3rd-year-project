import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../config/constant.dart';

import './add_employee_controller.dart';

import '../../component/custom_button.dart';
import '../../component/custom_textinput.dart';

class AddEmployee extends StatelessWidget {
  AddEmployeeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Add a New Employee',
            style: TextStyle(color: white),
          ),
          backgroundColor: appbarcolor,
        ), backgroundColor: background,
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
                onChange: (value) => controller.password = value,
                hintText: "Password",
              ),
              SizedBox(
                height: 20,
              ),
              TextInput(
                height: 40,
                width: MediaQuery.of(context).size.width,
                onChange: (value) => controller.c_password = value,
                hintText: "Confirm Password",
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
        controller.password +
        "\n" +
        controller.c_password);
    EasyLoading.showToast("Addnig....",
        toastPosition: EasyLoadingToastPosition.center);
    await controller.addEmployee();
    if (controller.addstate) {
      EasyLoading.showToast(controller.msg,
          toastPosition: EasyLoadingToastPosition.bottom);

      Get.offAllNamed("/Users");
    }
    EasyLoading.showToast(controller.msg+"\n"+controller.error,
        dismissOnTap: true, toastPosition: EasyLoadingToastPosition.bottom);
  }
}

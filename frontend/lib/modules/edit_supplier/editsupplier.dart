import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pharma_project/config/user_info.dart';
import '../../config/constant.dart';
import '../../component/custom_textinput.dart';
import '../../component/custom_button.dart';
import './editSupplier_controller.dart';

class EditSupplier extends StatefulWidget {
  @override
  State<EditSupplier> createState() => _EditSupplierState();
}

class _EditSupplierState extends State<EditSupplier> {
  EditSupplierController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Supplier',
          style: TextStyle(color: white),
        ),
        backgroundColor: appbarcolor,
      ),backgroundColor: background,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 350,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextInput(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .5,
                      onChange: (value) => controller.newName = value,
                      hintText: userInformation.Edit_Sup_name,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Email:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextInput(
                        height: 40,
                        width: MediaQuery.of(context).size.width * .5,
                        onChange: (value) => controller.newEmail = value,
                        hintText: userInformation.Edit_Sup_email),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Phone:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextInput(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .5,
                      onChange: (value) => controller.newPhone = value,
                      hintText: userInformation.Edit_Sup_phone,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Location:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextInput(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .5,
                      onChange: (value) => controller.newLocation = value,
                      hintText: userInformation.Edit_Sup_location,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Button(
                  hight: 40,
                  fontsize: 20,
                  width: MediaQuery.of(context).size.width*.3,
                  buttonColor: appbarcolor,
                  buttonName: "Done",
                  nameColor: white,
                  ontap: () {
                    click();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void click() async {
    if (controller.newName == '' || controller.newName == null) {
      print(userInformation.Edit_Sup_name);
      controller.newName = userInformation.Edit_Sup_name;
    } else {
      print(controller.newName);
      controller.newName = controller.newName;
    }

    if (controller.newEmail == '' || controller.newEmail == null) {
      print(userInformation.Edit_Sup_email);
      controller.newEmail = userInformation.Edit_Sup_email;
    } else {
      print(controller.newEmail);
      controller.newEmail = controller.newEmail;
    }
    if (controller.newPhone == '' || controller.newPhone == null) {
      print(userInformation.Edit_Sup_phone);
      controller.newPhone = userInformation.Edit_Sup_phone;
    } else {
      print(controller.newPhone);
      controller.newPhone = controller.newPhone;
    }
    if (controller.newLocation == '' || controller.newLocation == null) {
      print(userInformation.Edit_Sup_location);
      controller.newLocation = userInformation.Edit_Sup_location;
    } else {
      print(controller.newLocation);
      controller.newLocation = controller.newLocation;
    }

    EasyLoading.showToast("Editing....",
        toastPosition: EasyLoadingToastPosition.center);
    await controller.Edit();
    if (controller.editState) {
      EasyLoading.showToast(controller.msg,
          toastPosition: EasyLoadingToastPosition.bottom);

      Get.offAllNamed("/Suppliers");
    }
    EasyLoading.showToast(controller.msg + "\n" + controller.error,
        dismissOnTap: true, toastPosition: EasyLoadingToastPosition.bottom);
  }
}

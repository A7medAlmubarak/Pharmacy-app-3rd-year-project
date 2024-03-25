import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pharma_project/config/user_info.dart';
import '../../config/constant.dart';
import '../../component/custom_textinput.dart';
import '../../component/custom_button.dart';
import './editUser_controller.dart';

class EditUser extends StatefulWidget {
  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  EditUserController controller = Get.find();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Employee',
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
                  height: 20,
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
                      hintText: userInformation.Edit_User_name,
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
                      hintText: userInformation.Edit_User_email,
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
                      "Phone:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextInput(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .5,
                      onChange: (value) => controller.newPhone = value,
                      hintText: userInformation.Edit_User_phone,
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
      print(userInformation.Edit_User_name);
      controller.newName = userInformation.Edit_User_name;
    } else {
      print(controller.newName);
      controller.newName = controller.newName;
    }

    if (controller.newEmail == '' || controller.newEmail == null) {
      print(userInformation.Edit_User_email);
      controller.newEmail = userInformation.Edit_User_email;
    } else {
      print(controller.newEmail);
      controller.newEmail = controller.newEmail;
    }
    if (controller.newPhone == '' ||
        controller.newPhone == null) {
      print(userInformation.Edit_User_phone);
      controller.newPhone = userInformation.Edit_User_phone;
    } else {
      print(controller.newPhone);
      controller.newPhone = controller.newPhone;
    }

    EasyLoading.showToast("Editing....",
        toastPosition: EasyLoadingToastPosition.center);
    await controller.Edit();
    if (controller.editState) {
      EasyLoading.showToast(controller.msg,
          toastPosition: EasyLoadingToastPosition.bottom);

      Get.offAllNamed("/Users");
    }
    EasyLoading.showToast(controller.msg+"\n"+controller.error,
        dismissOnTap: true, toastPosition: EasyLoadingToastPosition.bottom);
  }
}

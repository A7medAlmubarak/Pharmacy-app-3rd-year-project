import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import './login_controller.dart';
import '../../config/constant.dart';

import '../../component/custom_button.dart';
import '../../component/custom_textinput.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class Login extends StatelessWidget {
  LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: background,
      appBar: AppBar(
        backgroundColor: appbarcolor,centerTitle: true,
        title: Image.asset(
          'assets/images/Logo.png',
          height: 50,
          width: 50,
          fit: BoxFit.contain,
        ),leading: Container(),
      ),
      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.only( left: 30 ,top:50 ),
            child: const Text(
              'Login ',
              style: TextStyle(
                fontSize: 30,
                color: black,fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              TextInput(
                height: 60,
                width: MediaQuery.of(context).size.width * .9,
                hintText: 'Email',
                inputType: TextInputType.text,
                onChange: (value) => controller.email = value,
              ),
              const SizedBox(
                height: 5,
              ),
              TextInput(
                height: 60,
                width: MediaQuery.of(context).size.width * .9,
                hintText: 'Password',
                inputType: TextInputType.text,
                onChange: (value) => controller.password = value,
              ),const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Dont have an account ',
                    style: TextStyle(
                      fontSize: 20,
                      color: black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed("/Register"),
                    child: Text(
                      'Create One ',
                      style: TextStyle(
                        fontSize: 20,
                        color: appbarcolor,

                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Row(mainAxisAlignment:MainAxisAlignment.end ,
                  children: [
                    Button(
                      fontsize: 20,
                      width: 100,
                      hight: 45,
                      buttonColor: white,
                      buttonName: "Back",
                      nameColor: appbarcolor,
                      ontap: () => Navigator.pop(context),
                    ),const SizedBox(
                      width: 20,
                    ),
                    Button(
                      fontsize: 20,
                      width: 100,
                      hight: 45,
                      buttonColor: appbarcolor,
                      buttonName: "Login",
                      nameColor: white,
                      ontap: () => onClickLogin(),
                    ),

                  ],
                ),
              ),

            ],
          )
        ],
      ),
    );
  }

  void onClickLogin() async {
    EasyLoading.showToast("Loading....",
        toastPosition: EasyLoadingToastPosition.bottom);
    await controller.LoginOnclick();
    if (controller.loginStatus) {
      EasyLoading.showToast(controller.error,
          dismissOnTap: true, toastPosition: EasyLoadingToastPosition.bottom);
      Get.offAllNamed("/Home");

      print(controller.token);
    }
    EasyLoading.showToast(controller.error,
        dismissOnTap: true, toastPosition: EasyLoadingToastPosition.bottom);
  }
}

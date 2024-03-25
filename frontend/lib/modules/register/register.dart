import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import './register_controller.dart';

import '../../config/constant.dart';
import '../../component/custom_textinput.dart';
import '../../component/custom_button.dart';
class Register extends StatelessWidget {
  RegisterController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: appbarcolor,centerTitle: true,
      title: Image.asset(
        'assets/images/Logo.png',
        height: 50,
        width: 50,
        fit: BoxFit.contain,
      ),leading: Container(),
    ),backgroundColor: background,
      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.only( left: 30 ,top:50 ),
            child: const Text(
              'Register',
              style: TextStyle(
                fontSize: 30,
                color: black,fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextInput(
            width: MediaQuery.of(context).size.width * .9,
            height: 60,
            hintText: "Full Name",
            onChange: (value) => controller.fullname = value,
          ),
          TextInput(
            width: MediaQuery.of(context).size.width * .9,
            height: 60,
            hintText: "Pharmacy Name",
            onChange: (value) => controller.Pharmacyname = value,
          ),
          TextInput(
            width: MediaQuery.of(context).size.width * .9,
            height: 60,
            hintText: "Location",
            onChange: (value) => controller.location = value,
          ),
          TextInput(
            width: MediaQuery.of(context).size.width * .9,
            height: 60,
            hintText: "Phone",
            onChange: (value) => controller.phone = value,
          ),
          TextInput(
            width: MediaQuery.of(context).size.width * .9,
            height: 60,
            hintText: "Email",
            onChange: (value) => controller.email = value,
          ),
          TextInput(
            width: MediaQuery.of(context).size.width * .9,
            height: 60,
            hintText: "password",
            onChange: (value) => controller.password = value,
          ),
          TextInput(
            width: MediaQuery.of(context).size.width * .9,
            height: 60,
            hintText: "confirm password",
            onChange: (value) => controller.passwordConfirm = value,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Already have an account ',
                style: TextStyle(
                  fontSize: 20,
                  color: black,
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed("/Login"),
                child: Text(
                  'Sign up ',
                  style: TextStyle(
                    fontSize: 20,
                    color: appbarcolor,

                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
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
                  buttonName: "Sign up",
                  nameColor: white,
                  ontap: () => onClickRegister(),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

        ],
      ),
    );
  }
  void onClickRegister()async{
    print(controller.fullname+"\n"+controller.Pharmacyname+"\n"+controller.phone+"\n"+controller.location+"\n"+controller.email+"\n"+controller.password+"\n"+controller.passwordConfirm);
    EasyLoading.showToast( "Loading....",toastPosition:EasyLoadingToastPosition.bottom );
    await controller.registerOnClick();

    if (controller.registerStatus){
      EasyLoading.showToast( controller.msg,dismissOnTap: true,toastPosition:EasyLoadingToastPosition.bottom );
      Get.offNamed("/Login");
    }else{
      EasyLoading.showError(controller.msg+"\n"+controller.error,dismissOnTap: true);
    }

  }
}

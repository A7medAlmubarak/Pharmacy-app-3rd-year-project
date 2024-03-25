import 'package:flutter/material.dart';
import 'package:get/get.dart';


import './landing_controller.dart';

import '../../config/constant.dart';
import '../../component/custom_button.dart';



class Landing extends StatelessWidget {
  LandingController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: appbarcolor),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: 200,
                child: Image.asset('assets/images/Logo.png'),////////////////////////////////////////////////
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Welcome',
                style: TextStyle(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Button(
                width: MediaQuery.of(context).size.width*.9,
                hight: 60,
                buttonColor: white,
                buttonName: "Signup", fontsize: 20,
                nameColor: appbarcolor,
                ontap: ()=>Get.toNamed("/Register"),
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                hight: 60,fontsize: 20,
                width: MediaQuery.of(context).size.width*.9,
                buttonColor:white,
                buttonName: "Login",
                nameColor: appbarcolor,
                ontap:()=>Get.toNamed("/Login") ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

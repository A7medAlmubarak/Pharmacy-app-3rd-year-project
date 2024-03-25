import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/constant.dart';
import '../config/user_info.dart';
import '../../native_service/secure_storage.dart';
class MyDrawer extends StatelessWidget {
  Securestorage _storage = Securestorage();


  @override
  Widget build(BuildContext context) {
    if(userInformation.user_id==1) {
      return Drawer(
        backgroundColor: background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: xanadu,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Welcome ${userInformation.user_name}',
                    style: TextStyle(
                      color: white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    userInformation.user_email,
                    style: TextStyle(
                      color: white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home_filled,
                color: silver,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: textcolor,
                  fontSize: 24,
                ),
              ),
              onTap: () {
                Get.offNamed("/Home");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.medical_services,
                color: silver,
              ),
              title: Text(
                'Medicine',
                style: TextStyle(
                  color: textcolor,
                  fontSize: 24,
                ),
              ),
              onTap: () {
                Get.offNamed("/Meds");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.supervised_user_circle,
                color: silver,
              ),
              title: Text(
                'Users',
                style: TextStyle(
                  color: textcolor,
                  fontSize: 24,
                ),
              ),
              onTap: () {
                Get.offNamed("/Users");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.store_rounded,
                color: silver,
              ),
              title: Text(
                'Suppliers',
                style: TextStyle(
                  color: textcolor,
                  fontSize: 24,
                ),
              ),
              onTap: () {
                Get.offNamed("/Suppliers");
              },
            ),
            ListTile(
              leading: Icon(
                Icons.sticky_note_2_rounded,
                color: silver,
              ),
              title: Text(
                'Bills',
                style: TextStyle(
                  color: textcolor,
                  fontSize: 24,
                ),
              ),
              onTap: () {
                Get.offNamed("/Bills");
              },
            ),

            ListTile(
              leading: Icon(
                Icons.exit_to_app_outlined,
                color: silver,
              ),
              title: Text(
                'LOG OUT',
                style: TextStyle(
                  color: textcolor,
                  fontSize: 24,
                ),
              ),
              onTap: () {
                userInformation.user_Token = "";
                _storage.delete("Token");

                Get.offNamed("/Landing");
              },
            ),
          ],
        ),
      );
    }else {
      return Drawer(
      backgroundColor: background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: xanadu,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Welcome ${userInformation.user_name}',
                  style: TextStyle(
                    color: white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  userInformation.user_email,
                  style: TextStyle(
                    color: white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home_filled,
              color: silver,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: textcolor,
                fontSize: 24,
              ),
            ),
            onTap: () {
              Get.offNamed("/Home");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.medical_services,
              color: silver,
            ),
            title: Text(
              'Medicine',
              style: TextStyle(
                color: textcolor,
                fontSize: 24,
              ),
            ),
            onTap: () {
              Get.offNamed("/Meds");
            },
          ),


          ListTile(
            leading: Icon(
              Icons.sticky_note_2_rounded,
              color: silver,
            ),
            title: Text(
              'Bills',
              style: TextStyle(
                color: textcolor,
                fontSize: 24,
              ),
            ),
            onTap: () {
              Get.offNamed("/Bills");
            },
          ),

          ListTile(
            leading: Icon(
              Icons.exit_to_app_outlined,
              color: silver,
            ),
            title: Text(
              'LOG OUT',
              style: TextStyle(
                color: textcolor,
                fontSize: 24,
              ),
            ),
            onTap: () {
              userInformation.user_Token = "";
              _storage.delete("Token");
              Get.offNamed("/Landing");
            },
          ),
        ],
      ),
    );
    }
  }
}

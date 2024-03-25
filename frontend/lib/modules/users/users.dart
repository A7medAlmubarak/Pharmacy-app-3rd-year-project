import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import './users_controller.dart';
import '../../config/constant.dart';
import '../../component/Drawer.dart';
import '../../component/employeesList.dart';
import '../../config/user_info.dart';
import '../../component/custom_button.dart';

class Users extends StatefulWidget {
  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  UsersController controller = Get.find();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Users',
            style: TextStyle(color: white),
          ),
          backgroundColor: appbarcolor,
        ),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: appbarcolor,
            child: Icon(
              Icons.person_add_sharp,
              color: white,
            ),
            onPressed: () => Get.toNamed("/AddEmployee")),
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
            itemCount: controller.EmployeesList.length,
            itemBuilder: (ctx, index) {
              return EmployeesList(
                name: controller.EmployeesList[index].name,
                phone: controller.EmployeesList[index].phone,
                email: controller.EmployeesList[index].email,
                del: () {
                  userInformation.del_id = controller.EmployeesList[index].id;
                  delClick(controller.EmployeesList[index].id);
                  setState(() {
                    controller.EmployeesList.removeWhere((element) {
                      return element.id == userInformation.del_id;
                    });
                  });
                  //Get.offNamed("/Suppliers");
                },
                ontap: () {
                  Get.defaultDialog(
                      title: "Employee Info",
                      titleStyle: TextStyle(color: appbarcolor),
                      backgroundColor: white,
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 300,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.EmployeesList[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, color: xanadu),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "phone",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.EmployeesList[index].phone,
                                    style: TextStyle(color: textcolor),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "email",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  FittedBox(fit:BoxFit.scaleDown, child:Text(controller.EmployeesList[index].email, style: TextStyle(color: textcolor),))
                                ],
                              ),
                              SizedBox(height: 10),
                              Button(
                                  hight: 50,
                                  width: double.infinity,
                                  buttonColor: appbarcolor,
                                  buttonName: "Edit",
                                  fontsize: 20,
                                  ontap: () {
                                    userInformation.Edit_User_name =
                                        controller.EmployeesList[index].name;
                                    userInformation.Edit_User_email =
                                        controller.EmployeesList[index].email;
                                    userInformation.Edit_User_phone =
                                        controller.EmployeesList[index].phone;
                                    userInformation.Edit_User_id =
                                        controller.EmployeesList[index].id;

                                    Get.toNamed("/EditUser");
                                  },
                                  nameColor: white),
                              SizedBox(height: 5,),
                              Button(
                                  hight: 50,
                                  width: double.infinity,
                                  buttonColor: xanadu,
                                  buttonName: "Show Sell History",
                                  fontsize: 20,
                                  nameColor: white,
                                  ontap: () {
                                    userInformation.Sell_bill_search_by_employee_name=controller.EmployeesList[index].name;
                                    userInformation.Sell_bill_search_by_employee_id=controller.EmployeesList[index].id;


                                    Get.toNamed("/EmployeeSellHistory");
                                  },
                                  )
                            ],
                          ),
                        ),
                      ));
                },
              );
            },
          );
        }),
      );
  }

  void delClick(int id) async {
    EasyLoading.showToast("deleting....",
        toastPosition: EasyLoadingToastPosition.bottom);
    await controller.delete(id);
    if (controller.delStatus) {
      EasyLoading.showToast(controller.msg,
          dismissOnTap: true, toastPosition: EasyLoadingToastPosition.bottom);
    }
  }
}

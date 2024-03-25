import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import './suppliers_controller.dart';
import '../../config/constant.dart';
import '../../component/Drawer.dart';
import '../../component/supplierList.dart';
import '../../config/user_info.dart';
import '../../component/custom_button.dart';

class Suppliers extends StatefulWidget {
  @override
  State<Suppliers> createState() => _SuppliersState();
}

class _SuppliersState extends State<Suppliers> {
  SuppliersController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Suppliers',
            style: TextStyle(color: white),
          ),
          backgroundColor: appbarcolor,
        ),
        backgroundColor: background,
        drawer: MyDrawer(),
        body: Obx(
          () {
            if (controller.isloading.isTrue) {
              return Center(
                child: CircularProgressIndicator(
                  color: six,
                ),
              );
            }
            return ListView.builder(
              itemCount: controller.SuppliersList.length,
              itemBuilder: (ctx, index) {
                return SupplierList(
                  name: controller.SuppliersList[index].name,
                  phone: controller.SuppliersList[index].phone,
                  email: controller.SuppliersList[index].email,
                  del: () {
                    userInformation.del_id = controller.SuppliersList[index].id;
                    delClick(controller.SuppliersList[index].id);
                    setState(() {
                      controller.SuppliersList.removeWhere((element) {
                        return element.id == userInformation.del_id;
                      });
                    });
                    Get.offNamed("/Suppliers");
                  },
                  ontap: () {
                    userInformation.select_id =
                        controller.SuppliersList[index].id;
                    Get.defaultDialog(
                        title: "Supplier Info",
                        titleStyle: TextStyle(color: appbarcolor),
                        backgroundColor: white,
                        content: Container(
                          width: 220,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.SuppliersList[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: xanadu),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "phone",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.SuppliersList[index].phone,
                                    style: TextStyle(color: textcolor),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "email",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(controller.SuppliersList[index].email,style: TextStyle(color: textcolor),)
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Location",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(controller.SuppliersList[index].location,style: TextStyle(color: textcolor),)
                                ],
                              ),
                              SizedBox(height: 10),
                              Button(
                                  hight: 50,
                                  width: double.infinity,
                                  buttonColor: appbarcolor,
                                  buttonName: "Buy from him",
                                  fontsize: 20,
                                  ontap: () {
                                    userInformation.Buy_Supplier_id = controller
                                        .SuppliersList[index].id
                                        .toString();
                                    Get.toNamed("/BuyCart");
                                  },
                                  nameColor: white),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Button(
                                      hight: 50,
                                      width: 70,
                                      buttonColor: silver,
                                      buttonName: "Edit",
                                      fontsize: 20,
                                      ontap: () {
                                        userInformation.Edit_Sup_name =
                                            controller
                                                .SuppliersList[index].name;
                                        userInformation.Edit_Sup_email =
                                            controller
                                                .SuppliersList[index].email;
                                        userInformation.Edit_Sup_phone =
                                            controller
                                                .SuppliersList[index].phone;
                                        userInformation.Edit_Sup_location =
                                            controller
                                                .SuppliersList[index].name;
                                        userInformation.Edit_Sup_id =
                                            controller.SuppliersList[index].id;
                                        Get.toNamed("/Editsupplier");
                                      },
                                      nameColor: white),
                                  SizedBox(width: 10,),
                                  Button(
                                      hight: 50,
                                      width: 140,
                                      buttonColor: xanadu,
                                      buttonName: "Show buy History",
                                      fontsize: 15,
                                      ontap: () {
                                        userInformation. Buy_bill_search_by_supplier_name =controller.SuppliersList[index].name;
                                        userInformation.Buy_bill_search_by_supplier_id=controller.SuppliersList[index].id;
                                        Get.toNamed("/SupplierBuyHistory");
                                      },
                                      nameColor: white)
                                ],
                              )
                            ],
                          ),
                        ));
                  },
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: appbarcolor,
            child: Icon(
              Icons.person_add_sharp,
              color: white,
            ),
            onPressed: () => Get.toNamed("/AddSupplier")));
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

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pharma_project/config/user_info.dart';
import '../../config/constant.dart';
import '../../component/custom_textinput.dart';
import '../../component/custom_button.dart';
import './editMedicin_controller.dart';

class EditMedicin extends StatefulWidget {
  @override
  State<EditMedicin> createState() => _EditMedicinState();
}

class _EditMedicinState extends State<EditMedicin> {
  EditMedicinController controller = Get.find();

  String dropdownValue = userInformation.Edit_Cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Medicin',
          style: TextStyle(color: white),
        ),
        backgroundColor: appbarcolor,
      ),backgroundColor: background,
      body: SingleChildScrollView(
        child: Center(
          child: Container(width: 380,
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
                      onChange: (value) => controller.Name = value,
                      hintText: userInformation.Edit_name,
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
                      "Price:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextInput(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .5,
                      onChange: (value) => controller.price = value,
                      hintText: userInformation.Edit_Price,
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
                      "Category:",
                      style: TextStyle(fontSize: 20),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: silver,
                      ),
                      elevation: 16,
                      style: const TextStyle(color: xanadu),dropdownColor: background,
                      underline: Container(
                        height: 2,
                        color: xanadu,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                        controller.cat = dropdownValue;
                      },
                      items: <String>[
                        "pills",
                        "Liquid",
                        "Tablet",
                        "Drops",
                        "Suppositories",
                        "Inhalers",
                        "Injections"
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Scientific", style: TextStyle(fontSize: 20)),
                        Text(" Material", style: TextStyle(fontSize: 20))
                      ],
                    ),
                    Text(":", style: TextStyle(fontSize: 20)),
                    TextInput(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .5,
                      onChange: (value) => controller.scientific_material = value,
                      hintText: userInformation.Edit_S_M,
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
                      "Company:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextInput(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .5,
                      onChange: (value) => controller.company = value,
                      hintText: userInformation.Edit_Company,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
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
    if (controller.Name == '' || controller.Name == null) {
      print(userInformation.Edit_name);
      controller.newName = userInformation.Edit_name;
    } else {
      print(controller.Name);
      controller.newName = controller.Name;
    }
    if (controller.price == '' || controller.price == null) {
      print(userInformation.Edit_Price);
      controller.newPrice = userInformation.Edit_Price;
    } else {
      print(controller.price);
      controller.newPrice = controller.price;
    }
    if (controller.company == '' || controller.company == null) {
      print(userInformation.Edit_Company);
      controller.newCompany = userInformation.Edit_Company;
    } else {
      print(controller.company);
      controller.newCompany = controller.company;
    }
    if (controller.scientific_material == '' ||
        controller.scientific_material == null) {
      print(userInformation.Edit_S_M);
      controller.newScientific_material = userInformation.Edit_S_M;
    } else {
      print(controller.scientific_material);
      controller.newScientific_material = controller.scientific_material;
    }
    print(dropdownValue);
    EasyLoading.showToast("Editing....",
        toastPosition: EasyLoadingToastPosition.center);
    await controller.Edit();
    if (controller.editState) {
      EasyLoading.showToast(controller.msg,
          toastPosition: EasyLoadingToastPosition.bottom);

      Get.offAllNamed("/Meds");
    }
    EasyLoading.showToast(controller.msg,
        dismissOnTap: true, toastPosition: EasyLoadingToastPosition.bottom);
  }
}

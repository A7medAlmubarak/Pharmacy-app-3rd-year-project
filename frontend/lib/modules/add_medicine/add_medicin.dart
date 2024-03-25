import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import './add_medicin_controller.dart';
import '../../config/constant.dart';
import '../../component/custom_button.dart';
import '../../component/custom_textinput.dart';


class AddMedicin extends StatefulWidget {
  @override
  State<AddMedicin> createState() => _AddMedicinState();
}

class _AddMedicinState extends State<AddMedicin> {
  AddMedicinController controller = Get.find();
  String dropdownValue = "pills";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Medicin',
          style: TextStyle(color: white),
        ),
        backgroundColor: appbarcolor,
      ),backgroundColor: background,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 380,
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
                      hintText:"example",
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
                      hintText: "100",
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
                      style: const TextStyle(color:  xanadu),dropdownColor: background,
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
                    Row(
                      children: [
                        Column(
                          children: [
                            Text("Scientific", style: TextStyle(fontSize: 20)),
                            Text(" Material", style: TextStyle(fontSize: 20))
                          ],
                        ),
                        Text(":", style: TextStyle(fontSize: 20)),
                      ],
                    ),

                    TextInput(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .5,
                      onChange: (value) => controller.scientific_material = value,
                      hintText: "eg.Paracetamol",
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
                      hintText: "eg.Hovid",
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
                      "Barcode Number:",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextInput(
                      height: 40,inputType: TextInputType.number,
                      width: MediaQuery.of(context).size.width * .4,
                      onChange: (value) => controller.barcode = value,
                      hintText: "eg.10010010",

                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                  hight: 40,
                  width:  MediaQuery.of(context).size.width*.3,
                  buttonColor: appbarcolor,
                  buttonName: "Add",
                  nameColor: white,
                  fontsize: 20,
                  ontap: () {
                    //addClick();
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

  void click()async{
    EasyLoading.showToast("Adding....",
        toastPosition: EasyLoadingToastPosition.center);
    await controller.Add();
    if (controller.AddState) {
      EasyLoading.showToast(controller.msg,
          toastPosition: EasyLoadingToastPosition.bottom);

      Get.offAllNamed("/Meds");
    }
    EasyLoading.showToast(controller.msg+"\n"+controller.error,
        dismissOnTap: true, toastPosition: EasyLoadingToastPosition.bottom);
  }
  }


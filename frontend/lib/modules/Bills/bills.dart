import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart' as sv;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../config/constant.dart';
import '../../component/Drawer.dart';
import './bills_controller.dart';
import '../../component/custom_button.dart';
import '../../component/custom_textinput.dart';
import '../../config/user_info.dart';

class Bills extends StatelessWidget {
  BillsController controller = Get.find();
  DateTime? _selectedDate1;
  DateTime? _selectedDate2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Bills',
            style: TextStyle(color: white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                icon: Icon(
                  Icons.search_sharp,
                  color: white,
                ),
                onPressed: () {
                  Get.bottomSheet(
                      StatefulBuilder(builder: (BuildContext context,
                          StateSetter setModalState /*You can rename this!*/) {
                    return Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      height: 300,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextInput(
                                    width:
                                        MediaQuery.of(context).size.width * .5,
                                    height: 60,
                                    color: white,
                                    hintText: "By Bill ID",
                                    onChange: (value) {
                                      userInformation.Search_Bill_ID = value;
                                    }),
                                Button(
                                  fontsize: 20,
                                  hight: 50,
                                  width: 150,
                                  buttonColor: appbarcolor,
                                  buttonName: "Search",
                                  nameColor: white,
                                  ontap: () {
                                    if (userInformation.search_bill_type ==
                                        "Sold") {
                                      if (userInformation.Search_Bill_ID !=
                                          "") {
                                        print("Sold  " +
                                            userInformation.Search_Bill_ID);
                                        Get.toNamed("/SellBillsSearchByID");
                                      } else {
                                        EasyLoading.showToast("Empty search",
                                            toastPosition:
                                                EasyLoadingToastPosition
                                                    .bottom);
                                      }
                                    }
                                    if (userInformation.search_bill_type ==
                                        "Bought") {
                                      if (userInformation.Search_Bill_ID !=
                                          "") {
                                        print("Bought  " +
                                            userInformation.Search_Bill_ID);
                                        Navigator.pop(context);
                                        Get.toNamed("/BuyBillsSearchByID");
                                      } else {
                                        EasyLoading.showToast("Empty search",
                                            toastPosition:
                                                EasyLoadingToastPosition
                                                    .bottom);
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        TextButton(
                                          child: Text(
                                              'Pick a Date To Search From',
                                              style: TextStyle(color: xanadu)),
                                          style: ButtonStyle(),
                                          onPressed: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2015),
                                                    lastDate: DateTime(2025))
                                                .then((pickedDate) {
                                              if (pickedDate == null) {
                                                return;
                                              }
                                              //controller.date = df.format(pickedDate) ;
                                              setModalState(() {
                                                _selectedDate1 = pickedDate;
                                              });
                                            });
                                          },
                                        ),
                                        Text(
                                          _selectedDate1 == null
                                              ? 'No date chosen!'
                                              : "picked Date: ${DateFormat.yMd().format(_selectedDate1!)}",
                                          style: TextStyle(color: black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        TextButton(
                                          child: Text(
                                              'Pick a date To Search To',
                                              style: TextStyle(color: xanadu)),
                                          style: ButtonStyle(),
                                          onPressed: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2015),
                                                    lastDate: DateTime(2025))
                                                .then((pickedDate) {
                                              if (pickedDate == null) {
                                                return;
                                              }
                                              setModalState(() {
                                                _selectedDate2 = pickedDate;
                                              });
                                            });
                                          },
                                        ),
                                        Text(
                                          _selectedDate2 == null
                                              ? 'No date chosen!'
                                              : "picked Date: ${DateFormat.yMd().format(_selectedDate2!)}",
                                          style: TextStyle(color: black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Button(
                                  fontsize: 20,
                                  hight: 50,
                                  width: 150,
                                  buttonColor: appbarcolor,
                                  buttonName: "Search",
                                  nameColor: white,
                                  ontap: () {
                                    if (userInformation.search_bill_date_from !=
                                            DateTime.now() &&
                                        userInformation.search_bill_date_to !=
                                            DateTime.now()) {
                                      userInformation.search_bill_date_from =
                                          _selectedDate1!;
                                      userInformation.search_bill_date_to =
                                          _selectedDate2!;
                                      if (userInformation.search_bill_type ==
                                          "Sold") {
                                        print("Sold  " +
                                            userInformation
                                                .search_bill_date_from
                                                .toString() +
                                            "  " +
                                            userInformation.search_bill_date_to
                                                .toString());
                                        Get.toNamed("/SellBillsSearchByDate");
                                      }
                                      if (userInformation.search_bill_type ==
                                          "Bought") {
                                        print("Bought  " +
                                            userInformation
                                                .search_bill_date_from
                                                .toString() +
                                            "  " +
                                            userInformation.search_bill_date_to
                                                .toString());
                                        Navigator.pop(context);
                                        Get.toNamed("/BuyBillsSearchByDate");
                                      }
                                    }
                                    else {
                                      EasyLoading.showToast("Empty search",
                                          toastPosition:
                                          EasyLoadingToastPosition
                                              .bottom);
                                    }

                                  },
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    );
                  }),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      backgroundColor: background);


                },
              ),
            )
          ],
          backgroundColor: appbarcolor,
          bottom: TabBar(
            onTap: (int index) {
              print(index);
              if (index == 0) {
                userInformation.search_bill_type = "Sold";
              } else if (index == 1) {
                userInformation.search_bill_type = "Bought";
              }
            },
            indicatorColor: silver,
            tabs: [
              Tab(
                text: ('Sold'),
              ),
              Tab(
                text: ('Bought'),
              ),
            ],
          ),
        ),
        drawer: MyDrawer(),
        backgroundColor: background,
        body: TabBarView(
          children: [
            Obx(
              () {
                if (controller.isSellLoading.isTrue) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: six,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: controller.sellBillsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            userInformation.select_sellbill_id =
                                controller.sellBillsList[index].id;
                            print(userInformation.select_sellbill_id);
                            Get.toNamed('/SellBillInfo');
                          },
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Bill number : ' +"#"+
                                  controller.sellBillsList[index].id
                                      .toString(),style: TextStyle(color: xanadu),),
                              Text('Date : ' +
                                  DateFormat.yMMMd().format(
                                      controller.sellBillsList[index].date),style: TextStyle(color: textcolor)),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sold by:" +
                                  controller.sellBillsList[index].user),
                              Text("total price:" +
                                  controller.sellBillsList[index].totalSellPrice
                                      .toString()),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Obx(() {
              if (controller.isBuyLoading.isTrue) {
                return Center(
                  child: CircularProgressIndicator(
                    color: six,
                  ),
                );
              }
              return ListView.builder(
                  itemCount: controller.buyBillsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            userInformation.select_buybill_id = controller.buyBillsList[index].id;
                            Get.toNamed('/BuyBillInfo');
                          },
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Bill number : ' +"#"+
                                  controller.buyBillsList[index].id.toString(),style: TextStyle(color: xanadu)),
                              Text('Date : ' +
                                  DateFormat.yMMMd().format(
                                      controller.buyBillsList[index].date),style: TextStyle(color: textcolor)),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Bought From : " +
                                  controller.buyBillsList[index].distributor),
                              Text("Total price : " +
                                  controller.buyBillsList[index].totalBuyPrice
                                      .toString()),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }


}

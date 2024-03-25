import 'package:get/get.dart';

import '../modules/Bills/bills_controller.dart';
import '../modules/Sell_Bill_info/sell_bill_info_controller.dart';

class SellBillInfoBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<SellBillInfoController> (SellBillInfoController());
  }

}
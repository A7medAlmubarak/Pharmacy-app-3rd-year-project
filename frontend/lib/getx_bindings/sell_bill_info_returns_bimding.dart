import 'package:get/get.dart';

import '../modules/sell_bill_info_returns/sell_bill_info_returns_controller.dart';

class SellBillInfoReturnsBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<SellBillInfoReturnsController> (SellBillInfoReturnsController());
  }

}
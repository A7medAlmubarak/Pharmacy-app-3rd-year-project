import 'package:get/get.dart';



import '../modules/buy_bill_info/buy_bill_info_controller.dart';

class BuyBillInfoBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<BuyBillInfoController> (BuyBillInfoController());
  }

}
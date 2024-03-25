import 'package:get/get.dart';


import '../modules/search/billsSearch/bought/by_number/bills_search_by_number_controller.dart';

class BuyBillSearchByNumberBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<BuyBillsSearchByNumberController> (BuyBillsSearchByNumberController());
  }

}
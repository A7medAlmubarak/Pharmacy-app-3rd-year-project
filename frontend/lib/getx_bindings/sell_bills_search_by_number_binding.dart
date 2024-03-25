import 'package:get/get.dart';


import '../modules/search/billsSearch/sold/by_number/bills_search_by_number_controller.dart';

class SellBillSearchByNumberBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<SellBillsSearchByNumberController> (SellBillsSearchByNumberController());
  }

}
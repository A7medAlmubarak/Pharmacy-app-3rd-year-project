import 'package:get/get.dart';


import '../modules/search/billsSearch/bought/by_date/bills_search_by_date_controller.dart';

class BuyBillSearchByDateBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<BuyBillsSearchByDateController> (BuyBillsSearchByDateController());
  }

}
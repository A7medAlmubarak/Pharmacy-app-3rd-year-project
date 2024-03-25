import 'package:get/get.dart';


import '../modules/search/billsSearch/sold/by_date/bills_search_by_date_controller.dart';

class SellBillSearchByDateBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<SellBillsSearchByDateController> (SellBillsSearchByDateController());
  }

}
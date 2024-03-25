import 'package:get/get.dart';


import '../modules/search/billsSearch/sold/by_employee/bills_search_by_employee_controller.dart';

class SellBillSearchByEmployeeBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<BillsSearchByEmployeeController> (BillsSearchByEmployeeController());
  }

}
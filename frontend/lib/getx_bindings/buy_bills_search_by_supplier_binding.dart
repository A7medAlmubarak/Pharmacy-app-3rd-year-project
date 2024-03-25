import 'package:get/get.dart';


import '../modules/search/billsSearch/bought/by_supplier/bills_search_by_supplier_controller.dart';

class BuyBillSearchBySupplierBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<BillsSearchBySupplierController> (BillsSearchBySupplierController());
  }

}
import 'package:get/get.dart';
import '../modules/Bills/bills_controller.dart';

class BillsBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<BillsController> (BillsController());
  }

}
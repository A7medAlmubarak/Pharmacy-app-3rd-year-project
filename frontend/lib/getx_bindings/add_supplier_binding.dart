import 'package:get/get.dart';
import '../modules/add_supplier/add_supplier_controller.dart';

class AddSupplierBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<AddSupplierController> (AddSupplierController());
  }

}
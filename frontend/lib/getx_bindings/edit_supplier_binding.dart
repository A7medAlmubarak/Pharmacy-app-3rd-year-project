import 'package:get/get.dart';
import '../modules/edit_supplier/editSupplier_controller.dart';

class EditSupplierBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<EditSupplierController> (EditSupplierController());
  }

}
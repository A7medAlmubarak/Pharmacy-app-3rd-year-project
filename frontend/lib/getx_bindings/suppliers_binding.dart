import 'package:get/get.dart';
import '../modules/supplier/suppliers_controller.dart';

class SuppliersBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<SuppliersController> (SuppliersController());
  }

}
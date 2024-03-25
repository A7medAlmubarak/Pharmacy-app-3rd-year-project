import 'package:get/get.dart';
import '../modules/sell/sellProductsList/sellProductsList_controller.dart';

class SellProductsListBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<SellProductsListController> (SellProductsListController());
  }

}
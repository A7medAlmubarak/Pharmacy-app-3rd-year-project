import 'package:get/get.dart';
import '../modules/return_med/return_product_List/returnProductListController.dart';


class ReturnProductsListBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<ReturnProductsListController> (ReturnProductsListController());
  }

}
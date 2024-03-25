import 'package:get/get.dart';
import '../modules/buy/buyProductsList/buyProductsList_controller.dart';

class BuyProductsListBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<BuyProductsListController> (BuyProductsListController());
  }

}
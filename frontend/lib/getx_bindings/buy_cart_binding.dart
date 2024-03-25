import 'package:get/get.dart';
import '../modules/buy/buyCart/buyCart_controller.dart';
import '../modules/sell/sellCart/sellcart_controller.dart';

class BuyCartBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<BuyCartController> (BuyCartController());
  }

}
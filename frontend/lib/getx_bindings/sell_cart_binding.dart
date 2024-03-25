import 'package:get/get.dart';
import '../modules/sell/sellCart/sellcart_controller.dart';

class SellCartBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<SellCartController> (SellCartController());
  }

}
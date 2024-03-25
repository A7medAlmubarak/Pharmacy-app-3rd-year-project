import 'package:get/get.dart';
import '../modules/return_med/return_cart/returncart_controller.dart';


class ReturnCartBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<ReturnCartController> (ReturnCartController());
  }

}
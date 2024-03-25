import 'package:get/get.dart';
import '../modules/search/homeSearch/by_barcode/home_search_by_barcode_controller.dart';

class HomeSearchByBarcodeBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<HomeSearchByBarcodeController> (HomeSearchByBarcodeController());
  }

}
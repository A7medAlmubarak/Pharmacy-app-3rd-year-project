import 'package:get/get.dart';
import '../modules/search/medsSearch/by_barcode/meds_search_by_barcode_controller.dart';

class MedsSearchByBarcodeBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<MedsSearchByBarcodeController> (MedsSearchByBarcodeController());
  }

}
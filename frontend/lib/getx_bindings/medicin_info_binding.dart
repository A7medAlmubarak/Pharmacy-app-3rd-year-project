import 'package:get/get.dart';
import '../modules/medicine_info/medicin_info_controller.dart';

class MedInfoBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<MedInfoController> (MedInfoController());
  }

}
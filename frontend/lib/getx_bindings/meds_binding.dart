import 'package:get/get.dart';
import '../modules/meds/meds_controller.dart';

class MedsBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<MedsController> (MedsController());
  }

}
import 'package:get/get.dart';
import '../modules/add_medicine/add_medicin_controller.dart';

class AddMedicinBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<AddMedicinController> (AddMedicinController());
  }

}
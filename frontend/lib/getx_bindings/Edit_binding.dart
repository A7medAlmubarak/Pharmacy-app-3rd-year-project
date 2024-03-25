import 'package:get/get.dart';
import '../modules/edit_medicine/editMedicin_controller.dart';

class EditBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<EditMedicinController> (EditMedicinController());
  }

}
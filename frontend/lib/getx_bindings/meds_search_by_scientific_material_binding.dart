import 'package:get/get.dart';
import '../modules/search/medsSearch/by_scientific_material/meds_search_by_scientific_material_controller.dart';

class MedsSearchByScientificMaterialBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<MedsSearchByScientificMaterialController> (MedsSearchByScientificMaterialController());
  }

}
import 'package:get/get.dart';
import '../modules/search/homeSearch/by_scientific_material/home_search_by_scientific_material_controller.dart';

class HomeSearchByScientificMaterialBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<HomeSearchByScientificMaterialController> (HomeSearchByScientificMaterialController());
  }

}
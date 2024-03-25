import 'package:get/get.dart';
import '../modules/search/medsSearch/by_name/meds_search_by_name_controller.dart';

class MedsSearchByNameBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<MedsSearchByNameController> (MedsSearchByNameController());
  }

}
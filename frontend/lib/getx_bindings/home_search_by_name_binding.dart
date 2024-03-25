import 'package:get/get.dart';
import '../modules/search/homeSearch/by_name/home_search_by_name_controller.dart';

class HomeSearchByNameBinding implements Bindings{
  @override
  void dependencies() {

    Get.put<HomeSearchByNameController> (HomeSearchByNameController());
  }

}
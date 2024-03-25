import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../config/user_info.dart';

import '../../../../models/homeSearchResult.dart';
import './home_search_by_name_service.dart';

class HomeSearchByNameController extends GetxController {
  HomeSearchByNameService service = HomeSearchByNameService();
  List<Med> meds = [];
  var msg;
  var error;
  var isloading = true.obs;

  void onReady() async {
    meds = await service.getAllMeds(userInformation.user_Token);
    isloading(false);
    if(meds.isEmpty){
      msg=service.msg;
      error=service.error;
      EasyLoading.showToast( msg+"\n"+error,toastPosition:EasyLoadingToastPosition.bottom );

    }
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    userInformation.Search_by_name = "";
    super.onClose();
  }
}

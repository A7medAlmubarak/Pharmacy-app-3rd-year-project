import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../config/user_info.dart';

import '../../../../models/medsIndex.dart';
import './meds_search_by_name_service.dart';

class MedsSearchByNameController extends GetxController {
  MedsSearchByNameService service = MedsSearchByNameService();
  List<Med>MedsList=[];
  var msg;
  var error;
  var isloading = true.obs;

  void onReady() async {
    MedsList = await service.getAllMeds(userInformation.user_Token);
    isloading(false);
    if(MedsList.isEmpty){
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

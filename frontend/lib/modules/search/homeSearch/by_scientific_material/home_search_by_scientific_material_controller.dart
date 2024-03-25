import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../config/user_info.dart';

import '../../../../models/homeSearchResult.dart';
import './home_search_by_scientific_material_service.dart';


class HomeSearchByScientificMaterialController extends GetxController {
  HomeSearchByScientificMaterialService service = HomeSearchByScientificMaterialService();
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
    for (Med M in meds) {
      print(M.name +
          "\n" +
          M.sellPrice.toString() +
          "\n" +
          M.storageQuantity.toString() +
          "\n" +
          M.barcodeNumber.toString()

         );
    }
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    userInformation.Search_by_SN = "";
    super.onClose();
  }
}

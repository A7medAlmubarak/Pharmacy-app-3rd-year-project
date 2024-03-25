import 'package:get/get.dart';
import './medicin_info_service.dart';
import '../../models/medicinInfo.dart';
import '../../config/user_info.dart';
class MedInfoController extends GetxController{
  MedInfoService service =MedInfoService();
   MedsInfo? medicinInfo ;
  var isloading = true.obs;


  void onReady() async {
    medicinInfo=await service.getmedicinInfo(userInformation.user_Token);
    isloading(false);
    /*for (MedsList M in meds ) {
      print(M.name+"\n"+M.sellPrice.toString()+"\n"+M.storageQuantity.toString());
    }*/
    print("testing");
    super.onReady();
  }



}
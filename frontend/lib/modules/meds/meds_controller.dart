import 'package:get/get.dart';
import 'package:pharma_project/modules/meds/meds_service.dart';
import '../../config/user_info.dart';
import '../../models/medsIndex.dart';

class MedsController extends GetxController {
  MedsService service = MedsService();
  List<Med>MedsList=[];
  var isloading = true.obs;

  void onReady() async {
    MedsList=await service.getAllMeds(userInformation.user_Token);
    isloading(false);
    for (Med M in MedsList ) {
      print(M.name+"\n"+M.sellPrice.toString()+"\n"+M.category.toString()+"\n"+M.scientificMaterial+"\n"+M.company);
    }

    super.onReady();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    if(userInformation.user_id==1){
      userInformation.user_id_bool=true;
    }else{
      userInformation.user_id_bool=false;

    }
print(userInformation.user_id_bool);

    super.onInit();
  }
}




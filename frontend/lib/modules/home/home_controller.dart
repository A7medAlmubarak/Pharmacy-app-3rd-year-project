import 'package:get/get.dart';
import '../../config/user_info.dart';
import './home_service.dart';
import '../../models/medsList.dart';
import '../../native_service/secure_storage.dart';

class HomeController extends GetxController {
  Homeservice service = Homeservice();
  List<MedsList>meds=[];
  var isloading = true.obs;


  void onReady() async {
    meds=await service.getAllMeds(userInformation.user_Token);
    isloading(false);
    for (MedsList M in meds ) {
      print(M.name+"\n"+M.sellPrice.toString()+"\n"+M.storageQuantity.toString());
    }
    super.onReady();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    Securestorage storage = Securestorage();
    var token= storage.read("Token");
    print (token);
   // print(userInformation.user_name+"\n"+userInformation.user_id.toString()+"\n"+userInformation.user_id_bool.toString()+"\n"+userInformation.user_Token);
    super.onInit();
  }


}

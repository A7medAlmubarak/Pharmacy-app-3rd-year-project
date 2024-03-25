import 'package:get/get.dart';
import '../../native_service/secure_storage.dart';

class SplashController extends GetxController{
  late Securestorage _storage ;
  @override
  void onInit() async{
    // TODO: implement onInit
    _storage =Securestorage();
    await checkToken();
    super.onInit();
  }

  Future<void>checkToken() async {
    String ? token = await _storage.read("Token");
    if(token != null){
      Get.offAllNamed("/Home");


    }else{
      Get.offNamed("/Landing");
    }


  }


}
import 'package:get/get.dart';
import './sellProductsList_service.dart';
import '../../../models/medsList.dart';
import '../../../config/user_info.dart';
import '../sellCart/sellcart_controller.dart';

class SellProductsListController extends GetxController{
  SellCartController cartController = Get.find();
  SellProductsListService service = SellProductsListService();
  List<MedsList>meds=[];
  var quantity;
  var isloading = true.obs;


  void onReady() async {
    meds=await service.getAllMeds(userInformation.user_Token);
    isloading(false);
    for (MedsList M in meds ) {
      print(M.name+"\n"+M.sellPrice.toString()+"\n"+M.storageQuantity.toString()+"\n"+M.barcode_number);
    }
    super.onReady();
  }
  void add(int addId,String addname,double addPrice,int addQuantity){
    cartController.p.add(product(name: addname,price: addPrice,quantity: addQuantity,id: addId));

  }

}
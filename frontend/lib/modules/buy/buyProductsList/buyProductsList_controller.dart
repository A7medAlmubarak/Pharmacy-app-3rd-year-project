import 'package:get/get.dart';
import '../../../models/medsIndex.dart';
import './buyProductsList_service.dart';
import '../../../models/medsList.dart';
import '../../../config/user_info.dart';
import '../buyCart/buyCart_controller.dart';

class BuyProductsListController extends GetxController{
  BuyCartController cartController = Get.find();
  BuyProductsListService service = BuyProductsListService();
  List<Med>meds=[];
  var quantity;
  var price;
  var isloading = true.obs;


  void onReady() async {
    meds=await service.getAllMeds(userInformation.user_Token);
    isloading(false);
    for (Med M in meds ) {
      print(M.name+"\n"+M.sellPrice.toString()+"\n"+M.barcode_number);
    }
    super.onReady();
  }
  void add(int addId,String addname,double addPrice,int addQuantity){
    cartController.p.add(product(name: addname,price: addPrice,quantity: addQuantity,id: addId));

  }

}
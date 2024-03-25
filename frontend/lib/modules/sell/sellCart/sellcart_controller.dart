import 'package:get/get.dart';
import '../../../models/newSellBill.dart';
import './sellCart_service.dart';
import '../../../config/user_info.dart';

class SellCartController extends GetxController {
  SellCertService service = SellCertService();


  var p = [].obs ;
  //List<product> p = [product(name: "setamol2", price: 100, id: 2, quantity: 3)].obs;


  List<Med> med = [];
  var msg;
  var createState;

  Future<void> CreateBill() async {
    createState = await service.CreateBill(userInformation.user_Token, med);

    print(service.msg);
    msg = service.msg;
  }

}

class product {
  final String? name;
  final double price;
   int id;
  final int quantity;
  product(
      {this.name,
        required this.price,
        required this.id,
        required this.quantity});
}
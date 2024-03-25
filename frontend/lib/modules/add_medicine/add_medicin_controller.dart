import 'package:get/get.dart';
import './add_medicin_service.dart';
import '../../config/user_info.dart';

class AddMedicinController extends GetxController{
  AddMedicinService service = AddMedicinService();

  var Name;
  var price;
  var scientific_material;
  var cat;
  var newCat_id;
  var company;
  var barcode;
  var AddState;
  var msg;
  var error;

  Future<void> Add() async {
    switch (cat) {
      case 'pills':
        newCat_id = 1;
        break;
      case 'Liquid':
        newCat_id = 2;
        break;
      case 'Tablet':
        newCat_id = 3;
        break;
      case 'Drops':
        newCat_id = 4;
        break;
      case 'Suppositories':
        newCat_id = 5;
        break;
      case 'Inhalers':
        newCat_id = 6;
        break;
      case 'Injections':
        newCat_id = 6;
        break;
    }
    AddState = await service.Add(
        userInformation.user_Token, Name, price, newCat_id,
        scientific_material, company,barcode);
    print("test");
    print("controller");
    print(service.msg);
    msg = service.msg;
    error = service.error;
    if (error is List) {
      String temp = '';
      for (String s in error)
        temp += s + '\n';
      error = temp;
    }
  }


}
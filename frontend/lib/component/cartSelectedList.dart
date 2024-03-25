import 'package:flutter/material.dart';
import '../config/constant.dart';

class CartSelectedList extends StatelessWidget {
  final String? name;
  final double? price;
  final int? quantity;

  final Function()? onedl;



  CartSelectedList({
    this.name,
    this.price,
    this.onedl,
    this.quantity
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      color: white,
      elevation: 5,
      child: ListTile(
        leading:IconButton(icon:Icon(Icons.delete_rounded),color: error,onPressed: onedl ,) ,
        //leading:Text(name!),
        title: Text(
          name!,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('\$'+
          price.toString()+" x "+quantity.toString(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: xanadu),
        ),

        trailing:Text('\$'+(price!*quantity!).toString(),style: TextStyle(color: silver,fontSize: 20),),
      ),
    );
  }
}

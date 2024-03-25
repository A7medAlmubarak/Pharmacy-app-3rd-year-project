import 'package:flutter/material.dart';
import '../config/constant.dart';

class CartBuySelectList extends StatelessWidget {
  final String? name;

  final Function()? ontap;
  final Function()? addtap;

  CartBuySelectList({
    this.name,
    this.addtap,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        color: white,
        elevation: 5,
        child: ListTile(
          //leading:Text(name!),
          title: Text(
            name!,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: xanadu),
          ),

          trailing: IconButton(
            onPressed: addtap,
            icon: Icon(Icons.add_circle,color: silver,),
          ),
        ),
      ),
    );
  }
}

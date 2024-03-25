import 'package:flutter/material.dart';
import '../config/constant.dart';

class CartSelectList extends StatelessWidget {
  final String? name;
  final double? price;
  final Function()? ontap;
  final Function()? addtap;



  CartSelectList({
    this.name,
    this.price,
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
          subtitle: Text('\$'+
            price.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:textcolor ),
          ),

          trailing:IconButton(onPressed: addtap,icon:Icon(Icons.add_circle,color: xanadu) ,),
        ),
      ),
    );
  }
}

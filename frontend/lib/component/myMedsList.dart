import 'package:flutter/material.dart';
import '../config/constant.dart';

class MedsList extends StatelessWidget {
  final String? name;
  final double? price;
  final int? quantity;

  final Function()? ontap;

  MedsList({
    this.name,
    this.price,
    this.quantity,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        color: white,
        elevation: 7,
        child: ListTile(
          //leading:Text(name!),
          title: Text(
            name!,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: xanadu),
          ),
          subtitle: Text('\$'+
            price.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: silver),
          ),

          trailing: Column(mainAxisAlignment:MainAxisAlignment.center ,
            children: [Text("Number in Store",style:TextStyle(color: textcolor) ,),SizedBox(height: 5,), Text(quantity.toString(),style: TextStyle(color: textcolor),)],
          ),
        ),
      ),
    );
  }
}

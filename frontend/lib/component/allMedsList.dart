import 'package:flutter/material.dart';
import 'package:pharma_project/config/user_info.dart';
import '../config/constant.dart';

class AllMedsList extends StatelessWidget {
  final String? name;
  final double? price;


  final Function()? ontap;


  AllMedsList({
    this.name,
    this.price,

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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: silver),
          ),



        ),
      ),
    );
  }
}

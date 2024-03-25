import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../config/constant.dart';

class Batchlist extends StatelessWidget {
  final double? No;
  final DateTime? Expdate;

  Batchlist({
    this.No,
    this.Expdate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      color: white,
      elevation: 5,
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
        children: [
          Column(
            children: [
              Text(
                "Numbers",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: xanadu),
              ),
              Text(
                No!.toString(),
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
          Column(
            children: [
              Text(
                "Expire Date",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: xanadu),
              ),
              Text(DateFormat.yM().format(Expdate!)),
            ],
          ),
        ],
        //leading:Text(name!),
      ),
    );
  }
}

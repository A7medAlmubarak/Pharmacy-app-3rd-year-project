import 'package:flutter/material.dart';
import '../config/constant.dart';

class SupplierList extends StatelessWidget {
  final String? name;
  final String? phone;
  final String? email;

  final Function()? ontap;
  final Function()? ondoubletap;
  final Function()? del;

  SupplierList(
      {this.name,
      this.email,
      this.phone,
      this.ontap,
      this.ondoubletap,
      this.del});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: ondoubletap,
      onTap: ontap,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        color: white,
        elevation: 5,
        child: ListTile(
          //leading:Text(name!),
          title: Text(
            name!,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          subtitle: Container(
              width: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Divider(
                    endIndent: 150,
                    thickness: 2,
                    color: xanadu,
                  ),
                   Text(
                    phone!,
                     style: TextStyle(color: textcolor),

                  ),
                ],
              )),

          trailing: IconButton(
            icon: Icon(Icons.delete),
            color:error,
            onPressed: del,
          ),
        ),
      ),
    );
  }
}

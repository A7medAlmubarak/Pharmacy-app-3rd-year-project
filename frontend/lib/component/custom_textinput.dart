

import 'package:flutter/material.dart';

import '../config/constant.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final double height, width;
  final int? maxlength;
  final TextInputType ? inputType;
  final Function(String) onChange;
  final Color? color;
   String? lableText;




  TextInput (
      {required this.width,
        required this.height,
        required this.hintText,
        this.inputType,
        this.maxlength,
        this.color,
        this.lableText,

        required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),

      width: width,
      height: height,
      decoration: BoxDecoration(
         // color: white,
          ),
      child:  Center(
        child: TextField(
          maxLength: maxlength,
          onChanged: onChange,
          cursorColor: silver,
          keyboardType: inputType ??  TextInputType.text,
          style: const TextStyle(
            color: textcolor,
            fontSize: 20,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            fillColor: white,
            filled: true,

            hintText: hintText,
            hintStyle: const TextStyle(
              color: silver,
              fontSize: 20,
            ),
            labelText: lableText,
            contentPadding: EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
}
// widget build(BuildContext context) {
//   return Container(
//     margin: EdgeInsets.all(10),
//
//     width: width,
//     height: height,
//     decoration: BoxDecoration(
//         color: color?.withAlpha(30),
//         border: Border(
//           bottom: BorderSide(
//               width: 2, color: white.withAlpha(20), style: BorderStyle.solid),
//           top: BorderSide(
//               width: 2, color: white.withAlpha(20), style: BorderStyle.solid),
//           left: BorderSide(
//               width: 2, color: white.withAlpha(20), style: BorderStyle.solid),
//           right: BorderSide(
//               width: 2, color: white.withAlpha(20), style: BorderStyle.solid),
//         )),
//     child:  Center(
//       child: TextField(
//         maxLength: maxlength,
//         onChanged: onChange,
//         cursorColor: white,
//         keyboardType: inputType ??  TextInputType.text,
//         style: const TextStyle(
//           color: white,
//           fontSize: 20,
//         ),
//         decoration: InputDecoration(
//           border: OutlineInputBorder(),
//
//           hintText: hintText,
//           hintStyle: const TextStyle(
//             color: white,
//             fontSize: 20,
//           ),
//           contentPadding: EdgeInsets.all(10),
//         ),
//       ),
//     ),
//   );
// }
// }


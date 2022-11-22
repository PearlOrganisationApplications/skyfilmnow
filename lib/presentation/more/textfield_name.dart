import 'package:flutter/material.dart';
import 'constants.dart';
Widget textFieldName(String title,BuildContext context){
  return Padding(
    padding:  EdgeInsets.only(bottom: getHeight(context)*0.01),
    child: Text(
      title,
      style: TextStyle(
          color: Color(0xffdcb33d),
          fontWeight: FontWeight.w600,
          fontSize:getHeight(context) * 0.02),
    ),
  );
}
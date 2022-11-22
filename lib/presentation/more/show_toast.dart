import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

customToast(String title){
  return Fluttertoast.showToast(msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xFF3355FF),
      textColor: Colors.white,
      fontSize: 16.0 );
}


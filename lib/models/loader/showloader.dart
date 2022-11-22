import 'package:flutter/material.dart';

Widget showLoader(bool isShown){
  return  Visibility(
    visible: isShown,
    child: const Center(
      child: CircularProgressIndicator(
        strokeWidth: 6,
      ),
    ),
  );
}
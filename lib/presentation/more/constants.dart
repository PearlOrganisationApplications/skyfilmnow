import 'package:flutter/material.dart';
double getHeight(BuildContext context){
  double mediaQueryHeight=MediaQuery.of(context).size.height;
  return mediaQueryHeight;
}
double getWidth(BuildContext context){
  double mediaQueryWidth=MediaQuery.of(context).size.width;
  return mediaQueryWidth;
}
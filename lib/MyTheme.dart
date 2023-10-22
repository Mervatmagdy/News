import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryColor=Color(0xff39A552);
  static Color redColor=Color(0xffC91C22);
  static Color blueDark=Color(0xff003E90);
  static Color blueColor=Color(0xff4882CF);
  static Color pinkColor=Color(0xffED1E79);
  static Color orangeColor=Color(0xffCF7E48);
  static Color yellowColor=Color(0xffF2D352);
  static Color whiteColor=Colors.white;
  static Color blueGery=Color(0xff4F5A69);
  static Color blueGeryDark=Color(0xff42505C);
  static Color geryColor=Color(0xff79828B);
  static Color blackColor=Color(0xff303030);
  static ThemeData lightTheme=ThemeData(
    primaryColor:primaryColor,
    appBarTheme:AppBarTheme(
      color:primaryColor,
      elevation: 0,
      centerTitle: true,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(38),
          bottomRight: Radius.circular(38)
        )
      )
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize:22,fontWeight:FontWeight.bold,color:blueGery),
      titleMedium: TextStyle(fontSize: 22,fontWeight:FontWeight.normal,color:whiteColor),
      titleSmall: TextStyle(fontSize:14,fontWeight:FontWeight.w500,color:blueGeryDark)
  )
);
}
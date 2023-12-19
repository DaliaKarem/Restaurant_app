import 'package:flutter/material.dart';
import 'package:restaurantapp/core/const/color.dart';

ThemeData  themeData=ThemeData(
    textTheme: TextTheme(
      headline1:  TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold),
      bodyText1:TextStyle(
          fontSize: 15, height: 2, color: colorApp.grey),
// bodyText2: TextStyle(
//     fontSize: 20, height: 2, color:Colors.black
// )
    )
);

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/onboadingcontroller.dart';
class Button extends GetView<onBoardingControllerImp> {
  Button({Key? key,required this.text,required this.color,required this.textcolor}) : super(key: key);
  String text;
  Color textcolor,color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 100,vertical:2 ),
        onPressed: (){
          if(text=='Continue'){ controller.nextPage();}
          if(text=='Skip'){ controller.skipPage();}
        },
        child: Text(text),
        color:color ,
        textColor:textcolor,
      ),
    );
  }
}


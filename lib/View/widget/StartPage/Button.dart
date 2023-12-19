import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/StartPageController.dart';
import 'package:restaurantapp/core/const/color.dart';

class Buttons extends GetView<StartPageControllerImp> {
  Buttons({Key? key,required this.textbutton,required this.onPressButton}) : super(key: key);
  void Function()? onPressButton;
  String ?textbutton;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: (){
      if(textbutton=="Login")
      {
        controller.gotoLogin();
      }
      else if(textbutton=="Get Started")
      {
        controller.gotoOnBoarding();
      }
    }, child: Text(textbutton!,style: TextStyle(fontSize: 15),),
      textColor: (textbutton=="Login")?colorApp.primary:Colors.white,
      color: (textbutton=="Login")?colorApp.background:colorApp.primary,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
        side: BorderSide(color:colorApp.primary ), // Set the border color
      ),
      padding: EdgeInsets.symmetric(horizontal:50,vertical:20),
    );

  }
}
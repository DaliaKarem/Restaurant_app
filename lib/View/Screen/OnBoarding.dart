
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/onboadingcontroller.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/view/widget/onBoarding/customButton.dart';
import 'package:restaurantapp/view/widget/onBoarding/dotontroller.dart';
import 'package:restaurantapp/view/widget/onBoarding/slidder.dart';

class onBoarding extends StatelessWidget {
  const onBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(onBoardingControllerImp());
    return Theme(
      data:Theme.of(context) ,
      child: Scaffold(
          body: SafeArea(
              child: Column(
                children: [
                  Expanded(flex: 3, child: slidder()),
                  Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          dotcontroller(),
                          SizedBox(
                            height: 30,
                          ),
                          Button(
                              text: "Continue",
                              color: colorApp.primary,
                              textcolor: Colors.white),
                          SizedBox(
                            height: 10,
                          ),
                          Button(
                              text: "Skip", color: Colors.white, textcolor: Colors.black),
                        ],
                      ))
                ],
              ))),
    );
  }
}
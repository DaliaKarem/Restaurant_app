import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/onboadingcontroller.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/data/datasource/static/static.dart';
class dotcontroller extends StatelessWidget {
  const dotcontroller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBoardingControllerImp>(builder: (controller){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
                  (index) => AnimatedContainer(
                margin: EdgeInsets.only(right:8),
                duration: Duration(microseconds: 500),
                width: controller.current==index ?20 :5,
                height: 5,
                decoration: BoxDecoration(
                    color: colorApp.primary,
                    borderRadius: BorderRadius.circular(10)),
              ))
        ],
      );
    });
  }
}
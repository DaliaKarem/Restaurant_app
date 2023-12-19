
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/const/routesName.dart';
import 'package:restaurantapp/core/services/services.dart';
import 'package:restaurantapp/data/datasource/static/static.dart';

abstract class onBoardingController extends GetxController
{
  //2fun ->1 to go to next page   , 2 dot will change
  nextPage();
  skipPage();
  dotChange(int page);
}
class onBoardingControllerImp extends onBoardingController{
  late PageController pageController;
  int current=0;
  myServices myservices=Get.find();
  @override
  void onInit() {
   pageController=PageController();
   super.onInit();
  }
  @override
  dotChange(int page) {
   current=page;
   update();
  }

  @override
  nextPage() {
    current++;
    if(current >= onBoardingList.length )
      {
        print("go to sign up page");
        //current=0;
        myservices.sharedPreferences.setString("onboarding", "1");
        Get.offAllNamed(routeApp.Login);
      }
    else{
      pageController.animateToPage(current, duration: Duration(microseconds: 500), curve: Curves.easeInOut);

    }
  }

  @override
  skipPage() {
    Get.offAllNamed(routeApp.Login);
  }

}
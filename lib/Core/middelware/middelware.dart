
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/const/routesName.dart';
import 'package:restaurantapp/core/services/services.dart';

class middelware extends GetMiddleware{
  //priority
  @override
  int? get priority=>1;
  myServices myservices=Get.find();
  @override
  RouteSettings? redirect(String? route){
    if(myservices.sharedPreferences.getString("onboarding")=="2")
    {
      print("Go to Restaurant Page");
      return RouteSettings(name: routeApp.RestaurantPage);
    }
    if(myservices.sharedPreferences.getString("onboarding")=="1")
      {
        print("Go to Login");
        return RouteSettings(name: routeApp.Login);
      }

  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:restaurantapp/core/const/routesName.dart';

import '../services/services.dart';

class middelware extends GetMiddleware{
  //priority
  @override
  int? get priority=>1;
  myServices myservices=Get.find();
  @override
  RouteSettings? redirect(String? route){
    if(myservices.sharedPreferences.getString("onboarding")=="2")
    {
      return RouteSettings(name: routeApp.Home);
    }
    if(myservices.sharedPreferences.getString("onboarding")=="1")
      {
        return RouteSettings(name: routeApp.SignUp);
      }

  }
}
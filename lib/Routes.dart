
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:restaurantapp/Core/middelware/middelware.dart';
import 'package:restaurantapp/core/const/routesName.dart';
import 'package:restaurantapp/view/screen/StartPage.dart';
import 'package:restaurantapp/view/screen/auth/Login.dart';
import 'package:restaurantapp/view/screen/auth/SignUp.dart';

import 'View/Screen/OnBoarding.dart';

List<GetPage<dynamic>>?routes=[
  GetPage(name: "/", page:()=> StartPage()),
  //page:()=>onBoarding(),middlewares: [middelware()]
  GetPage(name: routeApp.OnBoarding,page:()=>onBoarding() ),

//Auth
  GetPage(name: routeApp.Login, page:()=>Login()),
  GetPage(name: routeApp.SignUp, page:()=>SignUp()),


];
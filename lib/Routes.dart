import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:restaurantapp/core/const/routesName.dart';
import 'package:restaurantapp/view/Screen/ProductDetails.dart';
import 'package:restaurantapp/view/Screen/StarPage.dart';
import 'package:restaurantapp/view/Screen/auth/Forget_Success/ForgetPass.dart';
import 'package:restaurantapp/view/Screen/auth/Forget_Success/ResetPass.dart';
import 'package:restaurantapp/view/Screen/auth/Forget_Success/SuccessSign.dart';
import 'package:restaurantapp/view/Screen/auth/Forget_Success/VerificationCode.dart';
import 'package:restaurantapp/view/Screen/auth/Forget_Success/VerificationCode_Forget.dart';
import 'package:restaurantapp/view/screen/Home.dart';
import 'package:restaurantapp/view/screen/auth/Login.dart';
import 'package:restaurantapp/view/screen/auth/SignUp.dart';
import 'package:restaurantapp/view/Screen/RestaurantPage.dart';

import 'View/Screen/OnBoarding.dart';

List<GetPage<dynamic>>?routes=[
  GetPage(name: "/", page:()=> StartPage()),
  //page:()=>onBoarding(),middlewares: [middelware()]
  GetPage(name: routeApp.OnBoarding,page:()=>onBoarding() ),
  //RestaurantPages
  GetPage(name: routeApp.RestaurantPage, page:()=>RestaurantPage()),
//Auth
  GetPage(name: routeApp.Login, page:()=>Login()),
  GetPage(name: routeApp.SignUp, page:()=>SignUp()),
  GetPage(name: routeApp.ForgetPass, page:()=>ForgetPass()),
  GetPage(name: routeApp.verifySignCode, page:()=>VerificaionCode()),
  GetPage(name: routeApp.Verification_Forget, page:()=>VerificaionCode_Forget()),
  GetPage(name: routeApp.SuccessResetPass, page:()=>SuccessSign()),
  GetPage(name: routeApp.SuccessSignUp, page:()=>SuccessSign()),
  GetPage(name: routeApp.resetPass, page:()=>ResetPass()),


  //Home
  GetPage(name: routeApp.Home, page:()=>Home()),

  GetPage(name: routeApp.ProductDetails, page:()=>ProductDetails()),




];
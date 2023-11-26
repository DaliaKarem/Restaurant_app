
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:restaurantapp/core/const/routesName.dart';
import 'package:restaurantapp/view/screen/Home.dart';
import 'package:restaurantapp/view/screen/StartPage.dart';
import 'package:restaurantapp/view/screen/auth/Forget&Success/ForgetPass.dart';
import 'package:restaurantapp/view/screen/auth/Forget&Success/ResetPass.dart';
import 'package:restaurantapp/view/screen/auth/Forget&Success/SuccessSign.dart';
import 'package:restaurantapp/view/screen/auth/Forget&Success/VerificationCode.dart';
import 'package:restaurantapp/view/screen/auth/Forget&Success/VerificationCode_Forget.dart';
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
  GetPage(name: routeApp.ForgetPass, page:()=>ForgetPass()),
  GetPage(name: routeApp.verifySignCode, page:()=>VerificaionCode()),
  GetPage(name: routeApp.Verification_Forget, page:()=>VerificaionCode_Forget()),
  GetPage(name: routeApp.SuccessResetPass, page:()=>SuccessSign()),
  GetPage(name: routeApp.SuccessSignUp, page:()=>SuccessSign()),
  GetPage(name: routeApp.resetPass, page:()=>ResetPass()),


  //Home
  GetPage(name: routeApp.Home, page:()=>Home()),




];
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:restaurantapp/modules/Cart/presentation/Cart.dart';
import 'package:restaurantapp/modules/Favorite/presentation/Fav.dart';
import 'package:restaurantapp/modules/Home/presentaion/Home.dart';
import 'package:restaurantapp/modules/Home/presentaion/Category/Product.dart';
import 'package:restaurantapp/modules/Home/presentaion/Category/ProductDetails.dart';
import 'package:restaurantapp/modules/Registration/presentation/Registration.dart';
import 'package:restaurantapp/modules/Registration/presentation/login.dart';
import 'package:restaurantapp/modules/Registration/presentation/signup.dart';
import 'package:restaurantapp/modules/Setings/presentation/Settings.dart';
import 'package:restaurantapp/modules/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences=await SharedPreferences.getInstance();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: sharedPreferences.getString("user_id")==null ?"onboarding" :"Home" ,
      home: onboarding(),
      routes: {
        "onboarding":(context)=>onboarding(),
        "Home":(context)=>Home(),
        "Reg":(context)=>Reg(),
        "login":(context)=>login(),
        "signup":(context)=>Signup(),
        "ProductDetails":(context)=>ProductDetails(),
        "Product":(context)=>Product(),
        "Fav":(context)=>Fav(),
        "Cart":(context)=>Cart(),
        "Settings":(context)=>Settings()
      },
    );
  }
}

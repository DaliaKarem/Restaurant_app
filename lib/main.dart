import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:restaurantapp/modules/Home/presentaion/Home.dart';
import 'package:restaurantapp/modules/Registration/presentation/Registration.dart';
import 'package:restaurantapp/modules/Registration/presentation/login.dart';
import 'package:restaurantapp/modules/Registration/presentation/signup.dart';

void main() async{

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "Reg",
      home: Reg(),
      routes: {
        "Home":(context)=>Home(),
        "Reg":(context)=>Reg(),
        "login":(context)=>login(),
        "signup":(context)=>Signup(),
      },
    );
  }
}

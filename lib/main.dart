
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/Binding/binding.dart';
import 'package:restaurantapp/Core/services/services.dart';
import 'package:restaurantapp/Routes.dart';
import 'package:restaurantapp/core/const/appTheme.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:themeData,
      //home: onBoarding(),
      initialBinding:IntialBinding() ,
      getPages: routes,
      // routes: routes
    );
  }
}

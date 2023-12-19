import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/Binding/binding.dart';
import 'package:restaurantapp/core/services/services.dart';
import 'package:restaurantapp/Routes.dart';
import 'package:restaurantapp/core/const/appTheme.dart';



//Get.toNamed
//
// You can navigate from one page to another, and you can also go back by clicking the back button.
//
// Get.offNamed
//
// You can navigate from one page to another, but when you click on the back icon, it will back you 2 steps.
//
// Get.offAllNamed
//
// You can navigate from one page to another, but when you click on the back icon, you can't go back.
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

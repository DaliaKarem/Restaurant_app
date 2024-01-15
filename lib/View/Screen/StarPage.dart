import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/StartPageController.dart';
import 'package:restaurantapp/view/widget/StartPage/Container_Under_Image.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(StartPageControllerImp());
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset("assets/onboarding/startPage.png",fit: BoxFit.cover),
          ),
          UnderImage(
            headText: "Eat, Enjoy, Explore.",
            bodyText:
            "Embark on a culinary adventure with nearby eateries, where flavors fuse and gastronomic delights await your palate.",
            button1: "Login",

            button2: "Get Started",
          )
        ],
      ),
    );
  }
}
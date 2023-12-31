import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/view/Screen/Cart.dart';
import 'package:restaurantapp/view/Screen/Fav.dart';
import 'package:restaurantapp/view/screen/HomePage.dart';

abstract class homeSceenController extends GetxController{
  //initialData();
  //getData();
  changepage(int index);
}
class homeSceenControllerImp extends homeSceenController{
  int currentage=0;
  List<Widget> Pages=[
    HomePage(),
    Fav(),
    Cart(),
    Column(children: [
      Text("ncjn")
    ],),
    Column(children: [
      Text("mess")
    ],),
    Column(children: [
      Text("Profile")
    ],),
    // FavPage(),
    // CartPAge(),
    // settingsPage(),
    // Column(children: [
    //   Text("Profile")
    // ],),

  ];
  @override
  changepage(int index) {
    print("index ${index}");
    currentage=index;
    update();
  }

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/HomePageController.dart';
class ListOfCategories extends GetView<homePageControllerImp> {
  const ListOfCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50, // Set a height for the container
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Categoies();
        },
      ),
    );
  }
}
class Categoies extends StatelessWidget {
  const Categoies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(left: 5,right: 5),
        margin: EdgeInsets.symmetric(horizontal:10, vertical: 5),
        child: Center(
          child: Text(
            "chines Food ",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
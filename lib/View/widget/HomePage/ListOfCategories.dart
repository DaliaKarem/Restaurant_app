import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/homePagecontroller.dart';
import 'package:restaurantapp/data/model/CategoryModel.dart';
class ListOfCategories extends GetView<homePageControllerImp> {
  const ListOfCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50, // Set a height for the container
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.resCate.length,
        itemBuilder: (context, index) {
          return Categoies(categories:CategoryModel.fromJson(controller.resCate[index]));
        },
      ),
    );
  }
}
class Categoies extends GetView<homePageControllerImp> {
   Categoies({Key? key,required this.categories}) : super(key: key);

   final CategoryModel categories;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(left: 5,right: 5),
        margin: EdgeInsets.symmetric(horizontal:10, vertical: 5),
        child: Center(
          child: Text(
            categories.name!,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/homePagecontroller.dart';
import 'package:restaurantapp/view/widget/HomePage/ImageContainer.dart';
import 'package:restaurantapp/data/model/ProductModel.dart';

class ListOfMenu extends GetView<homePageControllerImp> {
  const ListOfMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: controller.Products.length,
        itemBuilder: (context, index) {
          return Container(
            child: ContainerOfTreding(
              product:productModel.fromJson(controller.Products[index]) ,
              height: 5,
            ),

          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 50.0,
        ),
      ),
    );
  }
}

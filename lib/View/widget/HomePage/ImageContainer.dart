import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/homePagecontroller.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/data/model/ProductModel.dart';
import 'package:restaurantapp/view/widget/Shared/largetext.dart';

class ImageContainer extends GetView<homePageControllerImp> {
  ImageContainer({Key? key, this.onTap}) : super(key: key);
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.separated(
        separatorBuilder: (Build, i) {
          return SizedBox(
            height: 30,
          );
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (build, index) {
          return ContainerOfTreding(
              onTap: onTap,
          product:productModel.fromJson(controller.Products[index]) ,
          );
        },
        itemCount: controller.Products.length,
      ),
    );
  }
}

class ContainerOfTreding extends StatelessWidget {
  ContainerOfTreding(
      {Key? key,
        required this.onTap,
        required this.product})
      : super(key: key);
  Function()? onTap;
productModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.img!,
                width: double.infinity,
                height: 100,
                fit: BoxFit.fill,
              ),
              LargeText(
                text: product.name!,
                fontSize: 17,
              ),
              LargeText(
                text: product.desc,
                fontSize: 15,
                color: Colors.grey.shade400,
              ),
              RatingBar.builder(
                initialRating: product.ratings!.toDouble(),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemSize: 20,
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
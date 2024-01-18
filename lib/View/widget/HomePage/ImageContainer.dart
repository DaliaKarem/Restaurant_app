import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/homePagecontroller.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/data/model/ProductModel.dart';
import 'package:restaurantapp/view/widget/Shared/largetext.dart';

class ImageContainer extends GetView<homePageControllerImp> {
  ImageContainer({Key? key}) : super(key: key);
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
          return GetBuilder<homePageControllerImp>(builder: (controller) {
            return ContainerOfTreding(
              product: productModel.fromJson(controller.Products[index]),
            );
          });
        },
        itemCount: controller.Products.length,
      ),
    );
  }
}

class ContainerOfTreding extends GetView<homePageControllerImp> {
  ContainerOfTreding({
    Key? key,
    //required this.onTap,
    required this.product,
    this.height,
  }) : super(key: key);

  //Function()? onTap;
  productModel product;
  double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: InkWell(
        onTap: (){
          print("product.category!.name!  ${product.category!.name!}");
          controller.gotoProductDetails(product.sId,product.name!, product.img!, product.price.toString()!, product.desc!,product.category!.name!);
        },
        child: GetBuilder<homePageControllerImp>(
          builder: (controller) {
            return Stack(
              children: [
                Container(
                  height: 400,
                  width: 200,
                  decoration: BoxDecoration(),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Image.network(
                        product.img!,
                        width: double.infinity,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        top: 8.0,
                        right: 8.0,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20.0,
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 8.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LargeText(
                        padding: 0,
                        text: product.name!,
                        fontSize: 17,
                      ),
                      LargeText(
                        padding: 0,
                        text: "Price: \$${product.price.toString()}",
                        fontSize: 17,
                      ),
                      LargeText(
                        padding: 0,
                        text: product.desc,
                        fontSize: 15,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: height,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RatingBarIndicator(
                          rating: product.ratings!.toDouble(),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurantapp/controller/RestaurantPageController.dart';
import 'package:restaurantapp/data/model/RestaurantModel.dart';

class ListOfRes extends GetView<RestaurantPageControllerImp> {
  const ListOfRes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: controller.Restaurants.length,
        itemBuilder: (context, i) {
          return (controller.Restaurants.isEmpty)?Center(
            child: Lottie.asset("assets/Lottie/Empty.json"),
          ):Restaurant(
            restaurantModel:
                RestaurantModel.fromJson(controller.Restaurants[i]),
          );
        },
      ),
    );
  }
}

class Restaurant extends StatelessWidget {
  const Restaurant({Key? key, required this.restaurantModel}) : super(key: key);
  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantPageControllerImp>(
      builder: (controller) {
        return InkWell(
          onTap: () {
            print("Restaurant tapped: ${restaurantModel.sId}");
            controller.gotoHome(restaurantModel.sId, restaurantModel.name);
          },
          child: Card(
              child: Container(
                  width: double.infinity,
                  child: GetBuilder<RestaurantPageControllerImp>(
                      builder: (controller) {
                    return Column(
                      children: [
                        Image.network(
                          restaurantModel.img!,
                          fit: BoxFit.fill,
                        ),
                        Column(
                          children: [
                            ListTile(
                              title: Text(
                                restaurantModel.name!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            RatingBarIndicator(
                              rating: restaurantModel.rateRes!.toDouble(),
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 30.0,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      ],
                    );
                  }))),
        );
      },
    );
  }
}

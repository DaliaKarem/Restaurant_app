import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/homePagecontroller.dart';
import 'package:restaurantapp/data/model/CategoryModel.dart';

class ListOfCategories extends GetView<homePageControllerImp> {
  const ListOfCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Set a height for the container
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.resCate.length,
        itemBuilder: (context, index) {
          return Categoies(
              categories: CategoryModel.fromJson(controller.resCate[index]));
        },
      ),
    );
  }
}

class Categoies extends StatelessWidget {
  Categoies({Key? key, required this.categories}) : super(key: key);

  final CategoryModel categories;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Image with gradient opacity
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    border: Border.all(),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://www.foodandwine.com/thmb/DI29Houjc_ccAtFKly0BbVsusHc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/crispy-comte-cheesburgers-FT-RECIPE0921-6166c6552b7148e8a8561f7765ddf20b.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    border: Border.all(),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.black12,
                        Colors.black45,
                      ],
                    ),
                )),
                // Text
                Center(
                  child: Text(
                    "1 menu",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                categories.name!,
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ],
        )
      ),
    );
  }
}

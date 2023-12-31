import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/homePagecontroller.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/view/widget/HomePage/ListOfCategories.dart';
import 'package:restaurantapp/view/widget/Shared/Search.dart';
import 'package:restaurantapp/view/widget/Shared/largetext.dart';
import 'package:restaurantapp/view/widget/Sign/TextFormField.dart';

import '../widget/HomePage/ImageContainer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homePageControllerImp controllerImp=Get.put(homePageControllerImp());
    return Scaffold(
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                Container(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: Image.network(
                          "https://meelz.me/images/Spanish%20Paella.jpg?1658844297041",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey.withOpacity(0.6),
                        child: Center(
                            child: Text(
                              "Welcome to Our Restaurant ${controllerImp.Restname}",
                              style: Theme.of(context).textTheme.headline1,
                            )),
                      ),
                      Search(bottom: -50,)
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ListOfCategories(),
                Row(
                  children: [
                    LargeText(
                      text: "Trending This Week",
                    ),
                    Spacer(),
                    LargeText(
                      link: true,
                      text: "View All",
                      color: colorApp.primary,
                      onPressed: () {},
                    ),
                  ],
                ),
                ImageContainer(),
                Row(
                  children: [
                    LargeText(
                      text: "Most Popular Restaurants",
                    ),
                    Spacer(),
                    LargeText(
                      link: true,
                      text: "View All ",
                      color: colorApp.primary,
                      onPressed: () {},
                    ),
                  ],
                ),
                ImageContainer(),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/homePagecontroller.dart';
import 'package:restaurantapp/core/class/handlingDataView.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/view/widget/HomePage/ListOfCategories.dart';
import 'package:restaurantapp/view/widget/Shared/NameOfUser.dart';
import 'package:restaurantapp/view/widget/Shared/Search.dart';
import 'package:restaurantapp/view/widget/Shared/largetext.dart';
import 'package:restaurantapp/view/widget/Sign/TextFormField.dart';

import '../widget/HomePage/ImageContainer.dart';
import '../widget/Shared/ButtonInSign.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(homePageControllerImp());
    return Scaffold(
      body: Container(
        child: GetBuilder<homePageControllerImp>(
          builder: (controllerImp){
            return ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(controllerImp.img!),
                              radius: 25,
                            ),
                            SizedBox(width: 10),
                            NameOfUser(username: controllerImp.name!,name: controllerImp.Restname,),
                          ],
                        )
                    ),
                    Search(),

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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0,right:150,bottom: 5),
                                  child: Text(
                                    "We have Offers Today Click on Button and See it",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontStyle:FontStyle.italic
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: ButtonInSign(w:100,v:15,textbutton: 'Offers', onPressed: () {  },),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      LargeText(
                        text: "Categories",
                      ),
                    ],),
                    SizedBox(
                      height: 10,
                    ),
                    handlingDataView(status: controllerImp.status!, widget: ListOfCategories(),),
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
                    handlingDataView(status: controllerImp.status!, widget: ImageContainer()),
                    Row(
                      children: [
                        LargeText(
                          text: "Recommended",
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
                    handlingDataView(status: controllerImp.status!, widget: ImageContainer()),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
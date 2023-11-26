import 'package:flutter/material.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/view/widget/HomePage/ListOfCategories.dart';
import 'package:restaurantapp/view/widget/Shared/largetext.dart';
import 'package:restaurantapp/view/widget/Sign/TextFormField.dart';

import '../widget/HomePage/ImageContainer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
       children: [
         Column(
           children: [
             Container(
               padding: EdgeInsets.only(left: 10),
               child: Row(
                 children: [
                   Text(
                     "Welcome Ahmed \nIn Our Restaurants World",
                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                   ),
                   Spacer(),
                   IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                 ],
               ),
             ),
             TextFormFields(
               isNum: false,
               hint: "Search..",
               icons: Icon(Icons.search),
               icons2: Icon(Icons.search),
               onTapIcon: () {},
             ),
             ListOfCategories(),
             Row(
               children: [
                 LargeText(text: "Trending This Week",),
                 Spacer(),
                 LargeText(link: true,text: "View All",color: colorApp.primary,onPressed: (){},),
               ],
             ),
             ImageContainer(),
             Row(
               children: [
                 LargeText(text: "Most Popular Restaurants",),
                 Spacer(),
                 LargeText(link: true,text: "View All ",color: colorApp.primary,onPressed: (){},),
               ],
             ),
             ImageContainer(),
             SizedBox(height: 15,)
           ],
         ),
       ],
      ),
    );
  }
}

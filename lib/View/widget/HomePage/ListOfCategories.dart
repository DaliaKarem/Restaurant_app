import 'package:flutter/material.dart';
import 'package:restaurantapp/core/const/color.dart';
class ListOfCategories extends StatelessWidget {
  const ListOfCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50, // Set a height for the container
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: 5,right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorApp.background.withOpacity(0.5)
            ),
            margin: EdgeInsets.symmetric(horizontal:10, vertical: 5),
            child: Center(
              child: Text(
                "chines Food ${index}",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}

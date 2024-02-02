import 'package:flutter/material.dart';
import 'package:restaurantapp/core/const/color.dart';
class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: 50,)
            ),
            color: colorApp.primary,
          )
        ],
      ),
    );
  }
}

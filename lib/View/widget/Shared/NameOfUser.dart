import 'package:flutter/material.dart';
import 'package:restaurantapp/core/const/color.dart';
class NameOfUser extends StatelessWidget {
   NameOfUser({Key? key,required this.username}) : super(key: key);
String username;
  @override
  Widget build(BuildContext context) {
    return  RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: 'Welcome To our App\n',
              style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'Grand Restaurant',
              style: TextStyle(fontSize: 24, color: colorApp.primary,fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: ' ${username}',
              style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
            ),
          ],
        ),
    );
  }
}

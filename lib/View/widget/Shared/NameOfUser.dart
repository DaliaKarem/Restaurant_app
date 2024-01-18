import 'package:flutter/material.dart';
import 'package:restaurantapp/core/const/color.dart';
class NameOfUser extends StatelessWidget {
  NameOfUser({Key? key, required this.username, this.name}) : super(key: key);
  String username;
  String? name;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
            text: 'Welcome ',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
            TextSpan(
              text: (name!=null)? '${name} \u{1F44B}' : 'In Grand Restaurant \u{1F44B}',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          TextSpan(
            text: '\n ${username}',
            style: TextStyle(fontSize: 24, color: colorApp.primary, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

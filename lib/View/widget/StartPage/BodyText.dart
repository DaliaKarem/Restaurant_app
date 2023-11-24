import 'package:flutter/material.dart';
class BodyText extends StatelessWidget {
   BodyText({Key? key,required this.bodyText}) : super(key: key);
String bodyText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 5),
      child: Text(bodyText!,
        style:TextStyle(fontSize: 15, color: Colors.white,),
      ),);
  }
}

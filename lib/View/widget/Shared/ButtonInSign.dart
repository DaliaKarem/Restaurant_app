import 'package:flutter/material.dart';
import 'package:restaurantapp/core/const/color.dart';

class ButtonInSign extends StatelessWidget {
  ButtonInSign(
      {Key? key, required this.textbutton, this.textColor, this.ButonColor})
      : super(key: key);
  String? textbutton;
  Color? textColor, ButonColor;

  @override
  Widget build(BuildContext context) {
   return Container(
     width: 200,
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          textbutton!,
          style: TextStyle(fontSize: 18),
        ),
        textColor: textColor ?? Colors.white,
        color: ButonColor ?? colorApp.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      ),

    );

  }
}

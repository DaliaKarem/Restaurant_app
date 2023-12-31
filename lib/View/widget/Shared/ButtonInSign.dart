import 'package:flutter/material.dart';
import 'package:restaurantapp/core/const/color.dart';

class ButtonInSign extends StatelessWidget {
  ButtonInSign(
      {Key? key, this.v,this.w,required this.textbutton, this.textColor, this.ButonColor,required this.onPressed})
      : super(key: key);
  String? textbutton;
  Color? textColor, ButonColor;
  void Function()? onPressed;
  double ?w,v;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w ?? 200,
      child: MaterialButton(
        onPressed:onPressed ,
        child: Text(
          textbutton!,
          style: TextStyle(fontSize: 18),
        ),
        textColor: textColor ?? Colors.white,
        color: ButonColor ?? colorApp.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: v??20),
      ),

    );

  }
}
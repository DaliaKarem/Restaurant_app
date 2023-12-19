import 'package:flutter/material.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/view/widget/StartPage/BodyText.dart';
import 'package:restaurantapp/view/widget/StartPage/Button.dart';
class UnderImage extends StatelessWidget {
   UnderImage({Key? key,required this.headText,required this.bodyText,this.button1,this.onPressButton1,this.button2,this.onPressButton2}) : super(key: key);
 String? headText,bodyText,button1,button2;
   void Function()? onPressButton1,onPressButton2;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        height: 250,
        width: 400,// Increase the height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: colorApp.background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(headText!, style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            BodyTextForSign(bodyText: bodyText!,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Buttons(textbutton: button1, onPressButton: onPressButton1,),
                Spacer(),
                Buttons(textbutton: button2, onPressButton:onPressButton2,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:restaurantapp/view/widget/Shared/HeadLineText.dart';

class HeadlineForFavCart extends StatelessWidget {
   HeadlineForFavCart({Key? key,required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, size: 30),
        ),
        SizedBox(width: 50,),
        HeadLineText(headline: text,toppaddng: 20,),

      ],
    );
  }
}

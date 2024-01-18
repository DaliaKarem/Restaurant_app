import 'package:flutter/material.dart';
class LargeText extends StatelessWidget {
  LargeText({Key? key, this.padding,this.fontSize,this.onPressed,this.link,required this.text,this.color}) : super(key: key);
  String ?text;
  bool?link;
  Color ?color;
  double?fontSize;
  Function()? onPressed;
  double?padding;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(padding ?? 10 ),
      child: (link==true)?
      TextButton(
        onPressed: onPressed,
        child:Text(
          text!,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize??17,
            color: color ??Colors.black54,
            decoration: TextDecoration.underline
        ),
        ),
      ) :Text(
        text!,style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize??20,
        color: color ??Colors.black54,
      ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
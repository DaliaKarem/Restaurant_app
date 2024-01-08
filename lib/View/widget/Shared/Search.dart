import 'package:flutter/material.dart';
import 'package:restaurantapp/view/widget/Sign/TextFormField.dart';
class Search extends StatelessWidget {
   Search({Key? key,this.top,this.bottom}) : super(key: key);
  double? bottom,top;
  @override
  Widget build(BuildContext context) {
    return  Positioned(
      bottom:bottom,
      top: top,
      child: Container(
        width: 400,
        child: TextFormFields(
          isNum: false,
          hint: "Search..",
          icons: Icon(Icons.search),
          icons2: Icon(Icons.search),
          onTapIcon: () {},
        ),
      ),
    );
  }
}

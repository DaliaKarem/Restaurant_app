import 'package:flutter/material.dart';
import 'package:restaurantapp/view/widget/Menu/ListOfMenu.dart';
import 'package:restaurantapp/view/widget/Shared/Fav_Cart_menu(Headline).dart';
class menu extends StatelessWidget {
  const menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          HeadlineForFavCart(text: 'Menu',),
          SizedBox(height: 20,),
          ListOfMenu()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:restaurantapp/view/widget/Fav/ListOfFav.dart';
import 'package:restaurantapp/view/widget/Shared/Fav_Cart_menu(Headline).dart';

import '../widget/Shared/HeadLineText.dart';
class Fav extends StatelessWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          HeadlineForFavCart(text: 'Favorites',),
          SizedBox(height: 20,),
          ListOfFav()
        ],
      ),
    );
  }
}

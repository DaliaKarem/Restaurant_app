import 'package:flutter/material.dart';
import 'package:restaurantapp/view/widget/Cart/ListOfCart.dart';
import 'package:restaurantapp/view/widget/Fav/ListOfFav.dart';
import 'package:restaurantapp/view/widget/Shared/Fav_Cart_menu(Headline).dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          HeadlineForFavCart(text: 'Cart',),
          SizedBox(height: 20,),
          ListOfCart()
        ],
      ),
    );
  }
}

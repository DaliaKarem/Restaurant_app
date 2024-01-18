import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/Fav-Cart/FavController.dart';
import 'package:restaurantapp/core/class/handlingDataView.dart';
import 'package:restaurantapp/view/widget/Fav/ListOfFav.dart';
import 'package:restaurantapp/view/widget/Shared/Fav_Cart_menu(Headline).dart';

import '../widget/Shared/HeadLineText.dart';
class Fav extends StatelessWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  Get.put(FavControllerImp());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          HeadlineForFavCart(text: 'Favorites',),
          SizedBox(height: 20,),
          GetBuilder<FavControllerImp>(builder:(favControllerImp){
            return  handlingDataView(status: favControllerImp.status!,widget: ListOfFav());

          } )
        ],
      ),
    );
  }
}

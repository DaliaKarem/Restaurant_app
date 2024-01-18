import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/Fav-Cart/CartController.dart';
import 'package:restaurantapp/core/class/handlingDataView.dart';
import 'package:restaurantapp/view/widget/Cart/ListOfCart.dart';
import 'package:restaurantapp/view/widget/Fav/ListOfFav.dart';
import 'package:restaurantapp/view/widget/Shared/ButtonInSign.dart';
import 'package:restaurantapp/view/widget/Shared/Fav_Cart_menu(Headline).dart';
import 'package:restaurantapp/view/widget/Shared/largetext.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          HeadlineForFavCart(
            text: 'Cart',
          ),
          SizedBox(
            height: 20,
          ),
          GetBuilder<CartControllerImp>(builder: (controllerImp){
            return  handlingDataView(status: controllerImp.status!,widget:ListOfCart())
            ;
          }),
          Positioned(
              bottom: 0,
              child: Container(
                  height: 100,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            LargeText(
                              text: "Total Price ",
                              color: Colors.black,
                            ),
                            Spacer(),
                            LargeText(
                              text: "330.000",
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                      ),
                      ButtonInSign(textbutton: "Check Out",onPressed: (){},w: double.infinity,v: 7,),
                    ],
                  ))
          )
        ],
      ),
    );
  }
}

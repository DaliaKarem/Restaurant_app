import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/RestaurantPageController.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/view/widget/RestaurantPage/ListOfRest.dart';
import 'package:restaurantapp/view/widget/Shared/NameOfUser.dart';
import 'package:restaurantapp/view/widget/Shared/Search.dart';
class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RestaurantPageControllerImp controller=Get.put(RestaurantPageControllerImp());
    return Scaffold(
      body: Column(
        children:[
          //Search
          Padding(
            padding: const EdgeInsets.only(top:50.0),
            child: Row(
              children: [
                Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtNvT7Xx61I94TEm_Jrr1j3FgAtGxxhPAqmr-5MQuYni6R8jOgYMCRfk_d4DvbCBfqNMk&usqp=CAU",width: 50,height: 50,),
                NameOfUser(username: controller.name!,),
              ],
            ),
          ),
          Search(),
         ListOfRes(),
        ] ,
      ),
    );
  }
}

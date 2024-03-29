import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/RestaurantPageController.dart';
import 'package:restaurantapp/core/class/handlingDataView.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/view/widget/RestaurantPage/ListOfRest.dart';
import 'package:restaurantapp/view/widget/Shared/NameOfUser.dart';
import 'package:restaurantapp/view/widget/Shared/Search.dart';
class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RestaurantPageControllerImp());
    return Scaffold(
      body:GetBuilder<RestaurantPageControllerImp>(
        builder:(controller){
          return  Column(
            children:[
              //Search
              Padding(
                padding: const EdgeInsets.only(top:50.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(controller.img!),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    NameOfUser(username: controller.name!),
                  ],
                )
              ),
              Search(),
              handlingDataView(status: controller.status!, widget:  ListOfRes(),)
            ] ,
          );
        }
      )
    );
  }
}

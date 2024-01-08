import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/const/routesName.dart';
import 'package:restaurantapp/core/services/services.dart';
import 'package:restaurantapp/core/class/satusReq.dart';
import 'package:restaurantapp/core/functions/handlingData.dart';
import 'package:restaurantapp/data/datasource/remote/CategoryData.dart';
import 'package:restaurantapp/data/datasource/remote/RestaurantsData.dart';
import 'package:restaurantapp/view/Screen/RestaurantPage.dart';
import 'package:restaurantapp/view/screen/HomePage.dart';

abstract class RestaurantPageController extends GetxController{
  getData();
 gotoHome(String? id,String? name);
}
class RestaurantPageControllerImp extends RestaurantPageController{
  myServices mysevices=Get.find();
  String ?name,id;
  RestaurantsData restaurantsData=RestaurantsData(Get.find());
  String? RestId;
  statusReq ?status;
  List Restaurants=[];

  @override
  initialData(){
     id=mysevices.sharedPreferences.getString("id");
     name=mysevices.sharedPreferences.getString("name");

  }
  @override
  void onInit() {
    initialData();
    print("Startt");
    getData();
    super.onInit();
  }
  @override
  getData() async {
    status = statusReq.loading;
    print("Hommmmmmmmm");

    var res = await restaurantsData.getRestaurants();
    status = handlingData(res);

    if (status == statusReq.success) {
      if (res['success'] == true) {
        print("Succcccccccccces");
        print(res);

        // Filter out users with role 'admin' from the response
        List<Map<String, dynamic>> adminUsers = (res['data'] as List)
            .cast<Map<String, dynamic>>()
            .where((user) => user['role'] == 'admin')
            .toList();

        Restaurants.addAll(adminUsers);
        Restaurants.forEach((user) {
          print("User Admin: $user");
        });
      } else {
        status = statusReq.Error;
      }
    }

    update();
  }

  @override
  gotoHome(String? id,String ?name) {
    Get.toNamed(routeApp.Home,arguments: {
      "RestId":id,
      "Restname":name
    });
  }


}
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/Core/services/services.dart';
import 'package:restaurantapp/core/class/HandlingData.dart';
import 'package:restaurantapp/core/functions/handlingData.dart';
import 'package:restaurantapp/data/datasource/remote/Category_Data.dart';
import 'package:restaurantapp/view/screen/HomePage.dart';

abstract class HomePageController extends GetxController{
 // getData();

}
class HomePageControllerImp extends HomePageController{
 // myServices mysevices=Get.find();
  //Category_Data category_data=Category_Data(Get.find());
  statusReq ?status;
  @override
  initialData(){
    //id=myservices.sharedPreferences.getString("id");

  }
  @override
  void onInit() {
    //initialData();
    print("Startt");
   // getData();
    super.onInit();
  }
  // @override
  // getData()async{
  //   //cart.clear();
  //   status=statusReq.loading;
  //   print("Categoriesssss");
  //   var res=await category_data.getData();
  //   print("cartvvvvvvvvv");
  //   status=handlingData(res);
  //   if(status==statusReq.success)
  //   {
  //     if(res['status']=='success')
  //     {
  //       //List resdata=res['data'];
  //      // cart.addAll(resdata.map((e) => CartModel.fromJson(e)));
  //       print("cart is:   ${res['data']}");
  //     }
  //     else{
  //       status=statusReq.Error;
  //     }
  //
  //   }
  //
  //   update();
  // }


}
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/services/services.dart';
import 'package:restaurantapp/core/class/satusReq.dart';
import 'package:restaurantapp/core/functions/handlingData.dart';
import 'package:restaurantapp/data/datasource/remote/CategoryData.dart';
import 'package:restaurantapp/view/screen/HomePage.dart';

abstract class HomePageController extends GetxController{
 getData();

}
class homePageControllerImp extends HomePageController{
    myServices mysevices=Get.find();
  CategoryData category_data=CategoryData(Get.find());
  statusReq ?status;
  @override
  initialData(){
   // id=mysevices.sharedPreferences.getString("id");

  }
  @override
  void onInit() {
    //initialData();
    print("Startt");
    getData();
    super.onInit();
  }
  @override
  getData()async{
    //cart.clear();
    status=statusReq.loading;
    print("Categoriesssss");
    var res=await category_data.getData();
    print("cartvvvvvvvvv");
    status=handlingData(res);
    if(status==statusReq.success)
    {
      if(res['status']=='success')
      {
        print("Succcccccccccces");
        print(res);
        //List resdata=res['data'];
       // cart.addAll(resdata.map((e) => CartModel.fromJson(e)));
        //print("cart is:   ${res['data']}");
      }
      else{
        status=statusReq.Error;
      }

    }

    update();
  }


}
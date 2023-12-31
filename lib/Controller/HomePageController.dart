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
    String ?name,id;
  HomeData home_data=HomeData(Get.find());
  statusReq ?status;
    List resCate=[];
    List Products=[];

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
  getData()async{
    status=statusReq.loading;
    print("Hommmmmmmmm");
    var res=await home_data.getCategory();
    var product=await home_data.getProduct();
    status=handlingData(res);
    if(status==statusReq.success)
    {
      if(res['success']==true && product['success']==true)
      {
        print("Succcccccccccces");
        print(res);
        resCate.addAll(res['data']);
        Products.addAll(res['data']);
        print("PRoducts     ${Products}"  );
       //print("ResCate ${resCate}" );
      }
      else{
        status=statusReq.Error;
      }

    }

    update();
  }

}
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/const/routesName.dart';
import 'package:restaurantapp/core/services/services.dart';
import 'package:restaurantapp/core/class/satusReq.dart';
import 'package:restaurantapp/core/functions/handlingData.dart';
import 'package:restaurantapp/data/datasource/remote/CategoryData.dart';
import 'package:restaurantapp/view/screen/HomePage.dart';

abstract class HomePageController extends GetxController{
 getData();
 gotoProductDetails(String,String name,String img,String price,String desc,String Cate );
}
class homePageControllerImp extends HomePageController{
    myServices mysevices=Get.find();
    String ?name,id,img;
    String RestId=Get.arguments['RestId'],Restname=Get.arguments['Restname'];
  HomeData home_data=HomeData(Get.find());
  statusReq ?status;
    List resCate=[];
    List Products=[];
    bool isNew=false;

    @override
  initialData(){
    id=mysevices.sharedPreferences.getString("id");
    name=mysevices.sharedPreferences.getString("name");
    img=mysevices.sharedPreferences.getString("img");
    }
  @override
  void onInit() {
    initialData();
    print("Startt at  ${Restname}");
    getData();
    super.onInit();
  }
  @override
  getData()async{
      update();
    status=statusReq.loading;
    print("Hommmmmmmmm");
    var res=await home_data.getCategory();
    print("ResstIDDDd  ${RestId } RestId");
    var product=await home_data.getProduct(RestId!);
    status=handlingData(res);
    if(status==statusReq.success)
    {
      if(res['success']==true && product['success']==true)
      {
        print("Succcccccccccces");
        print(res);
        resCate.addAll(res['data']);
        Products.addAll(product['data']);
        print("PRoducts     ${Products}"  );
        for(int i=0;i<Products.length;i++)
          {
            print("Createddd   ${Products[i]['name']} ${Products[i]['createdAt']}");
            if(Products[i]['createdAt']==DateTime.now())
              {
                print("Products[i]['name'] ${Products[i]['name']}");
                isNew=true;
              }
          }
       //print("ResCate ${resCate}" );
      }
      else{
        status=statusReq.Error;
      }

    }

    update();
  }

  @override
  gotoProductDetails(id,name,img,price,desc,cate) {
      Get.toNamed(routeApp.ProductDetails,arguments: {
        "id":id,
        "name":name,
        "img":img,
        "price":price,
        "desc":desc,
        "cate":cate
      });
  }

}
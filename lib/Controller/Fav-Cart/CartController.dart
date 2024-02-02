import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/services/services.dart';
import 'package:restaurantapp/core/class/satusReq.dart';
import 'package:restaurantapp/core/functions/handlingData.dart';
import 'package:restaurantapp/data/datasource/remote/CartData.dart';
import 'package:restaurantapp/data/datasource/remote/CategoryData.dart';
import 'package:restaurantapp/data/datasource/remote/FavData.dart';
import 'package:restaurantapp/view/screen/HomePage.dart';

abstract class CartController extends GetxController{
  getCart();
  addCart(Strig);
  removeCart(Sring);
}
class CartControllerImp extends CartController{
  myServices mysevices=Get.find();
  String ?name,id,idUser;
  String RestId=Get.arguments['RestId'],Restname=Get.arguments['Restname'];
  CartData cartData=CartData(Get.find());
  statusReq ?status;
  List Carts=[];

  @override
  initialData(){
    id=mysevices.sharedPreferences.getString("id");
    name=mysevices.sharedPreferences.getString("name");
    idUser=mysevices.sharedPreferences.getString("idUser");
  }
  @override
  void onInit() {
    initialData();
    print("Startt at  ${Restname}");
    getCart();
    super.onInit();
  }
  @override
  getCart()async{
    status=statusReq.loading;
    print("Hommmmmmmmm");
    var product=await cartData.getCart(idUser!,RestId!);
    status=handlingData(product);
    if(status==statusReq.success)
    {
      if(product['success']==true)
      {
        print("Succcccccccccces");
        print(product);
        Carts.addAll(product['data']);
        print("FAVSSSSS     ${Carts}"  );
      }
      else{
        status=statusReq.Error;
      }

    }

    update();
  }
  @override
  addCart(idProduct)async {
    status=statusReq.loading;
    var res=await cartData.addCart(idUser!, RestId, idProduct);
    status=handlingData(res);
    if(status==statusReq.success)
    {
      if(res['success']==true){
        print("Added Successfully ");
        Get.rawSnackbar(title: "Done",message: "Added Successfully");
      }else{
        status=statusReq.Error;
      }
    }
    update();
  }

  @override
  removeCart(idProduct)async {
    status=statusReq.loading;
    var res=await cartData.removeCart(idUser!, RestId, idProduct);
    status=handlingData(res);
    if(status==statusReq.success)
    {
      if(res['success']==true){
        print("Removed Successfully ");
        Get.rawSnackbar(title: "Done",message: "Removed Successfully");
      }else{
        status=statusReq.Error;
      }
    }
    update();
  }
}
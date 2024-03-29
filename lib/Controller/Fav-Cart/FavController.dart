import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/services/services.dart';
import 'package:restaurantapp/core/class/satusReq.dart';
import 'package:restaurantapp/core/functions/handlingData.dart';
import 'package:restaurantapp/data/datasource/remote/CategoryData.dart';
import 'package:restaurantapp/data/datasource/remote/FavData.dart';
import 'package:restaurantapp/view/screen/HomePage.dart';

abstract class FavController extends GetxController{
  getFav();
  addFav(string);
  removeFav(String);
}
class FavControllerImp extends FavController{
  myServices mysevices=Get.find();
  String ?name,id,idUser;
  String RestId=Get.arguments['RestId'],Restname=Get.arguments['Restname'];
  FavData favData=FavData(Get.find());
  statusReq ?status;
  List Favs=[];

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
    getFav();
    super.onInit();
  }
  @override
  getFav()async{
    status=statusReq.loading;
    print("Hommmmmmmmm");
    var product=await favData.getFav(idUser!,RestId!);
    status=handlingData(product);
    if(status==statusReq.success)
    {
      if(product['success']==true)
      {
        print("Succcccccccccces");
        print(product);
        Favs.addAll(product['data']);
        print("FAVSSSSS     ${Favs}"  );
        //print("ResCate ${resCate}" );
      }
      else{
        status=statusReq.Error;
      }

    }

    update();
  }

  @override
  addFav(idProduct)async {
    status=statusReq.loading;
    var res=await favData.addFav(idUser!, RestId, idProduct);
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
  removeFav(idProduct)async {
    status=statusReq.loading;
    var res=await favData.removeFav(idUser!, RestId, idProduct);
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
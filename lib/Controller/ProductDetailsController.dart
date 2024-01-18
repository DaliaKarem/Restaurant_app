import 'package:get/get.dart';
import 'package:restaurantapp/core/class/satusReq.dart';
import 'package:restaurantapp/core/const/routesName.dart';
import 'package:restaurantapp/core/functions/handlingData.dart';
import 'package:restaurantapp/data/datasource/remote/rateProductData.dart';

import '../core/services/services.dart';

abstract class ProductDetailsController extends GetxController{
  rateProduct(double);
}
class ProductDetailsControllerImp extends ProductDetailsController{
  String ?name,price,desc,img,cate,id;
  myServices mysevices=Get.find();
  rateProductData ratedata=rateProductData(Get.find());
  statusReq? status;
  @override
  initalData() {
    name=Get.arguments['name'];
    price=Get.arguments['price'];
    desc=Get.arguments['desc'];
    img=Get.arguments['img'];
    cate=Get.arguments['cate'];
    id=Get.arguments['id'];
  }
  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  @override
  rateProduct(rate)async {
    var res=await ratedata.postData(rate,id);
    status=handlingData(res);
    print("Status is :   ${status}"  );
    if(status==statusReq.success)
      {
        print("Succcesssssss");
        Get.defaultDialog(title: "Done",middleText: "Your Rate has sent successfully");
       // Get.offNamed(routeApp.Home);

      }
    else{
      print("Faaaaaaaailll");
      Get.defaultDialog(title: "Error",middleText: "Can't send rate");

    }
  }


}
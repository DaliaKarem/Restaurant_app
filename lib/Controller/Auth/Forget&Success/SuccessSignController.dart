import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/const/routesName.dart';

abstract class SuccessSignController extends GetxController{
  gotoLogin();

}
class SuccessSignControllerImp extends SuccessSignController{
  // late TextEditingController? Email;

  @override
  void onInit() {
    //Email=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    // Email?.dispose();
    super.dispose();
  }

  @override
  gotoLogin() {
    Get.toNamed(routeApp.Login);
  }


}
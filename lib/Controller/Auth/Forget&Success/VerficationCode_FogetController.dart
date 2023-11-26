import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/const/routesName.dart';

abstract class verificationCode_ForgetController extends GetxController{
  gotoReset();

}
class verificationCode_ForgetControllerImp extends verificationCode_ForgetController{
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
  gotoReset() {
    Get.toNamed(routeApp.resetPass);
  }


}
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/const/routesName.dart';

abstract class verificationCodeController extends GetxController{
gotoSucess();
}
class verificationCodeControllerImp extends verificationCodeController{
  late TextEditingController? Email;

  @override
  void onInit() {
    Email=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    Email?.dispose();
    super.dispose();
  }

  @override
  gotoSucess() {
    Get.toNamed(routeApp.SuccessSignUp);


  }

}
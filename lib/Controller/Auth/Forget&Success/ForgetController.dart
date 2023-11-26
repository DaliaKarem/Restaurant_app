import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/const/routesName.dart';

abstract class ForgetController extends GetxController{
  gotoVeriicationCode_Forget();

}
class ForgetControllerImp extends ForgetController{
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
  gotoVeriicationCode_Forget() {
   // Get.offAllNamed(routeApp.verifySignCode);
    Get.toNamed(routeApp.Verification_Forget);

  }

}
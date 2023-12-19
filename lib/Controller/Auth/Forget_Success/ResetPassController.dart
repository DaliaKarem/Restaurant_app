import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/const/routesName.dart';

abstract class ResetPassController extends GetxController{
  gotoSuccess();

}
class ResetPassControllerImp extends ResetPassController{
  bool Press=true;
  late TextEditingController Pass;
  late TextEditingController rePass;
  GlobalKey<FormState>formstate=GlobalKey<FormState>();

  void onInit() {
    Pass=TextEditingController();
    rePass=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    Pass?.dispose();
    rePass?.dispose();
    super.dispose();
  }
  ShowPass() {
    Press=Press==true?false:true;
    print(Press);
    update();
  }

  @override
  gotoSuccess() {
    Get.toNamed(routeApp.SuccessResetPass);
  }


}
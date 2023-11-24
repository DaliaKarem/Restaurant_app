import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/const/routesName.dart';

abstract class LoginController extends GetxController{
  gotoHome();
  gotoForget();
  gotoSignUp();
}
class LoginControllerImp extends LoginController{
  bool Press=true;
  late TextEditingController? Email;
  late TextEditingController? Pass;

  @override
  void onInit() {
    Email=TextEditingController();
    Pass=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    Email?.dispose();
    Pass?.dispose();
    super.dispose();
  }

  ShowPass() {
    Press=Press==true?false:true;
    print(Press);
    update();
  }

  @override
  gotoHome() {
  }

  @override
  gotoForget() {

  }

  @override
  gotoSignUp() {
    print("Go to SignUp");
    Get.offAllNamed(routeApp.SignUp);
  }

}
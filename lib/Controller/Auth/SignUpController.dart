import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/const/routesName.dart';

abstract class SignUpController extends GetxController{
  gotoSendVerf();
  gotoLogin();
}
class SignUpControllerImp extends SignUpController{
  bool Press=true;
  late TextEditingController? Email;
  late TextEditingController? Pass;
  late TextEditingController? Name;
  late TextEditingController? Phone;


  @override
  void onInit() {
    Email=TextEditingController();
    Pass=TextEditingController();
    Name=TextEditingController();
    Phone=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    Email?.dispose();
    Pass?.dispose();
    Phone?.dispose();
    Name?.dispose();
    super.dispose();
  }

  ShowPass() {
    Press=Press==true?false:true;
    print(Press);
    update();
  }

  @override
  gotoLogin() {
    print("Go to SignUp");
    Get.offAllNamed(routeApp.Login);
  }

  @override
  gotoSendVerf() {
    // TODO: implement gotoSendVerf
    throw UnimplementedError();
  }

}
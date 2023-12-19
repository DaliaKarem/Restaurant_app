import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/core/class/HandlingData.dart';
import 'package:restaurantapp/core/const/routesName.dart';
import 'package:restaurantapp/core/functions/handlingData.dart';
import 'package:restaurantapp/data/datasource/remote/auth/SignupData.dart';
import 'package:restaurantapp/core/class/crud.dart';

abstract class SignUpController extends GetxController{
  SignUp();
  gotoSendVerf();
  gotoLogin();
}
class SignUpControllerImp extends SignUpController{
  bool Press=true;
  late TextEditingController? Email;
  late TextEditingController? Pass;
  late TextEditingController? Name;
  late TextEditingController? Phone;
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
  List getdata=[];
  statusReq? status;
  signUpData signupdata=signUpData(Get.find());

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
    print("Go to Login");
    Get.toNamed(routeApp.Login);
  }

  @override
  gotoSendVerf() {
    //Get.offNamed(routeApp.verifySignCode);
    Get.toNamed(routeApp.verifySignCode);
  }

  @override
  SignUp()async {
    var form=formstate.currentState;
    if(form!.validate()){
      status=statusReq.loading;
      update();
      var res=await signupdata.postData(Name!.text,Email!.text,Pass!.text,Phone!.text);
      status=handlingData(res);
      print("=================================$res");
      if(status==statusReq.success)
      {
        if(res['status']=='success')
        {
          Get.offNamed(routeApp.Login,arguments: {"email":Email!.text});
         // Get.offNamed(routeApp.verifySignCode,arguments: {"email":email.text});
        }
        else{
          Get.defaultDialog(title: "Warning",middleText: "Email or Phone  Exists");
          status=statusReq.Error;
        }

      }
      update();
      //bec when we go to sign up again after verification data saved
      //Get.delete<SignUpControllerImp>();
    }
    else{
      print("Error in sign");
    }

  }

}
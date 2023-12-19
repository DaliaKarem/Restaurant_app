import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:restaurantapp/core/class/satusReq.dart';
import 'package:restaurantapp/core/const/routesName.dart';
import 'package:restaurantapp/core/functions/handlingData.dart';
import 'package:restaurantapp/data/datasource/remote/auth/SignupData.dart';
abstract class SignUpController extends GetxController{
  SignUp();
  goToLogin();
  goToForget();
}
class SignUpControllerImp extends SignUpController {
  bool Press = true;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController userName;
  late TextEditingController phone;
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
  List getdata=[];
   statusReq? status;
  signUpData signupdata=signUpData(Get.find());
  showPass()
  {
    Press=Press==true?false:true;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    email = TextEditingController();
    password = TextEditingController();
    userName= TextEditingController();
    phone= TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    userName.dispose();
    phone.dispose();
    super.dispose();
  }


  @override
  SignUp()async {
    var form=formstate.currentState;
    print("Formmmmmm");
    if(form!.validate()){
      status=statusReq.loading;
      update();
      var res=await signupdata.postData(userName.text,email.text,password.text,phone.text);
      status=handlingData(res);
      print("=================================$res");
      if(status==statusReq.success)
      {
        if(res['success']=='success')
        {
          Get.offNamed(routeApp.verifySignCode,arguments: {"email":email.text});
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

  @override
  goToLogin() {
    Get.toNamed(routeApp.Login);
  }
  @override
  goToForget() {
    Get.toNamed(routeApp.ForgetPass);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:restaurantapp/core/class/satusReq.dart';
import 'package:restaurantapp/core/const/routesName.dart';
import 'package:restaurantapp/core/functions/handlingData.dart';
import 'package:restaurantapp/core/services/services.dart';
import 'package:restaurantapp/data/datasource/remote/auth/loginData.dart';
abstract class LoginController extends GetxController{
  login();
  goToSignUp();
  goToForget();
}
class LoginControllerImp extends LoginController{
  var Press=true;
 late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState>formstate=GlobalKey<FormState>();
  statusReq? status;
  loginData logindata=loginData(Get.find());
  myServices myserveices=Get.find();
  showPass()
  {
    Press=Press==true?false:true;
    update();
  }
  @override
  void onInit() {
    email=TextEditingController();
    password=TextEditingController();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  login() async{
    var form=formstate.currentState;
    if(form!.validate()){
      status=statusReq.loading;
      update();
      var res=await logindata.postData(email.text,password.text);
      status=handlingData(res);
      print("=================================${res['token']}  ${res['data']['email']}  ");
      if(status==statusReq.success)
      {
        if(res['success']==true)
        {
          myserveices.sharedPreferences.setString("id",res['token'] );
          myserveices.sharedPreferences.setString("img",res['data']['img'] );
          myserveices.sharedPreferences.setString("email",res['data']['email'] );
          myserveices.sharedPreferences.setString("name", res['data']['name']);
          myserveices.sharedPreferences.setString("idUser", res['data']['_id']);
          myserveices.sharedPreferences.setString("onboarding", "2");
          Get.offNamed(routeApp.RestaurantPage);
        }
        else{
          Get.defaultDialog(title: "Error",middleText: "Email or Pass No Correct");
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
  goToSignUp() {
    Get.offNamed(routeApp.SignUp);
  }

  @override
  goToForget() {
    Get.toNamed(routeApp.ForgetPass);
  }

}
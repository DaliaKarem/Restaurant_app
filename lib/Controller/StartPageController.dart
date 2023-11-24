import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:restaurantapp/Core/services/services.dart';
import 'package:restaurantapp/core/const/routesName.dart';

abstract class StartPageController extends GetxController
{
  gotoOnBoarding();
 gotoLogin();
}
class StartPageControllerImp extends StartPageController {
  myServices myservices=Get.find();

  @override
  gotoLogin() {
    myservices.sharedPreferences.setString("onboarding", "1");
    print("GO to Login");
    Get.offAllNamed(routeApp.Login);

  }

  @override
  gotoOnBoarding() {
    print("To on Boarding");
    Get.offAllNamed(routeApp.OnBoarding);

  }
}
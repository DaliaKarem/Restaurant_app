import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurantapp/controller/Auth/Forget_Success/SuccessSignUpController.dart';
import 'package:restaurantapp/view/widget/Shared/ButtonInSign.dart';
class SuccessSign extends StatelessWidget {
  const SuccessSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignControllerImp controllerImp=Get.put(SuccessSignControllerImp());
    return Scaffold(
      body: Column(
        children: [
          LottieBuilder.asset("assets/Lottie/success.json"),
          SizedBox(height: 20,),
          Center(child: Text("Done",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.only(top:80),
            child: ButtonInSign(textbutton: "Login", onPressed: (){
              controllerImp.gotoLogin();
            }),
          ),
        ],
      ),
    );
  }
}
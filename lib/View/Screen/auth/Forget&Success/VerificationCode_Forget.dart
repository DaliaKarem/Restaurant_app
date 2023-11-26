import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:restaurantapp/controller/Auth/Forget&Success/VerficationCode_FogetController.dart';
import 'package:restaurantapp/view/widget/Shared/BodyText.dart';
import 'package:restaurantapp/view/widget/Shared/HeadLineText.dart';
import 'package:otp_text_field/otp_text_field.dart';
class VerificaionCode_Forget extends StatelessWidget {
  const VerificaionCode_Forget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    verificationCode_ForgetControllerImp controllerImp=Get.put(verificationCode_ForgetControllerImp());
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),

          HeadLineText(headline: "Verification Code For Forget"),
          SizedBox(height: 20,),

          BodyText(textBody: 'Enter Code Which is sent in your Email',),
          SizedBox(height: 60,),

          OTPTextField(
            length: 5,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 60,
            style: TextStyle(
                fontSize: 17
            ),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.box,
            onCompleted: (pin) {
              print("Completed: " + pin);
              //Go to ResetPass
              controllerImp.gotoReset();
            },

          ),
        ],
      ),
    );
  }
}

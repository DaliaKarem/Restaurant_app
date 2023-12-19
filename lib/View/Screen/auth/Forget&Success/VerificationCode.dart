import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:restaurantapp/controller/Auth/Forget&Success/VerficationCodeController.dart';
import 'package:restaurantapp/core/functions/ValidatorText.dart';
import 'package:restaurantapp/view/widget/Shared/BodyText.dart';
import 'package:restaurantapp/view/widget/Shared/ButtonInSign.dart';
import 'package:restaurantapp/view/widget/Shared/HeadLineText.dart';
import 'package:restaurantapp/view/widget/Sign/TextFormField.dart';
import 'package:restaurantapp/view/widget/StartPage/BodyText.dart';
class VerificaionCode extends StatelessWidget {
  const VerificaionCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    verificationCodeControllerImp controller=Get.put(verificationCodeControllerImp());
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          HeadLineText(headline: "Verification Code"),
          SizedBox(height: 20,),

          BodyTextForSign(
            bodyText: 'Enter Code Which is sent in your Email',),
          SizedBox(height: 60,),

          OTPTextField(
            length: 5,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 60,
            style: TextStyle(
                fontSize: 10
            ),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.box,
            onCompleted: (pin) {
              print("Completed: " + pin);
              controller.gotoSucess();

            },
          ),
        ],
      ),
    );
  }
}

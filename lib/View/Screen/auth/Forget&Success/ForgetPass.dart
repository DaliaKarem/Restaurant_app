import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/Auth/Forget&Success/ForgetController.dart';
import 'package:restaurantapp/core/functions/ValidatorText.dart';
import 'package:restaurantapp/view/widget/Shared/ButtonInSign.dart';
import 'package:restaurantapp/view/widget/Shared/HeadLineText.dart';
import 'package:restaurantapp/view/widget/Sign/TextFormField.dart';
import 'package:restaurantapp/view/widget/StartPage/BodyText.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetControllerImp controllerImp = Get.put(ForgetControllerImp());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          HeadLineText(headline: "Forget Pass"),
          SizedBox(
            height: 30,
          ),
          BodyTextForSign(
              bodyText:
                  "Enter Your Email and we will send to you verification code "),
          SizedBox(
            height: 20,
          ),
          TextFormFields(
              validator: (val) {
                return ValidatorInput("email", val!, 6, 12);
              },
              isNum: false,
              hint: "Enter Your Email",
              lable: "Email",
              icons: Icon(Icons.person),
              controllerText: controllerImp.Email!),
          ButtonInSign(
            textbutton: "Send Code",
            onPressed: ()=>controllerImp.gotoVeriicationCode_Forget(),
          )
        ],
      ),
    );
  }
}

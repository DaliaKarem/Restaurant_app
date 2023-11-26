import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurantapp/controller/Auth/LoginController.dart';
import 'package:restaurantapp/controller/Auth/SignUpController.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/core/functions/ValidatorText.dart';
import 'package:restaurantapp/view/widget/Shared/ButtonInSign.dart';
import 'package:restaurantapp/view/widget/Shared/HeadLineText.dart';
import 'package:restaurantapp/view/widget/Sign/TextFormField.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controllerImp = Get.put(SignUpControllerImp());
    return Theme(
      data: Theme.of(context),
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                HeadLineText(headline: "SIGN Up"),
                SizedBox(
                  height: 20,
                ),
                // BodyText(
                //     bodyText:
                //         "Welcome You can Sign in with your Email an Pass If you Forget Your pass Click on Forget Pass "),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome You can Sign Up with your Name,Email,Pass and PhoneNumber If you have an account already Click on Login ",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormFields(
                  validator: (val){
                    return ValidatorInput("name",val!,6,12);
                  },
                  isNum:false,
                  hint: '',
                  lable: 'Name',
                  icons: Icon(Icons.person),
                  controllerText: controllerImp.Email!,
                ),
                TextFormFields(
                  validator: (val){
                    return ValidatorInput("email",val!,6,12);
                  },
                  isNum:false,
                  hint: 'yourEmail@gmail.com',
                  lable: 'Email',
                  icons: Icon(Icons.alternate_email),
                  controllerText: controllerImp.Email!,
                ),
                TextFormFields(
                  validator: (val){
                    return ValidatorInput("phone",val!,6,12);
                  },
                  isNum:true,
                  hint: '',
                  lable: 'Phone Number',
                  icons: Icon(Icons.phone_android),
                  controllerText: controllerImp.Email!,
                ),
                GetBuilder<SignUpControllerImp>(builder:(controller){
                  return TextFormFields(
                      validator: (val){
                        return ValidatorInput("pass",val!,6,12);
                      },
                      isNum:false,
                      press: controllerImp.Press,
                      onTapIcon: () {
                        controllerImp.ShowPass();
                      },
                      icons2: Icon(Icons.visibility_off),
                      hint: '',
                      lable: 'Password',
                      icons: Icon(Icons.remove_red_eye),
                      controllerText: controllerImp.Pass!
                  );
                } ),

                SizedBox(
                  height: 10,
                ),
                ButtonInSign(
                  textbutton: 'Sign Up', onPressed: ()=>controllerImp.gotoSendVerf(),
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text("Have an Account ",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white, fontSize: 15))),
                    Container(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: TextButton(
                            onPressed: () {
                              controllerImp.gotoLogin();
                            },
                            child: Text(
                              "Log in",
                              textAlign: TextAlign.start,
                              style:
                              TextStyle(color: colorApp.primary, fontSize: 15),
                            ))),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

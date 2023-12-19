import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:restaurantapp/controller/Auth/LoginController.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/core/functions/ValidatorInput.dart';
import 'package:restaurantapp/view/widget/Shared/ButtonInSign.dart';
import 'package:restaurantapp/view/widget/Shared/HeadLineText.dart';
import 'package:restaurantapp/view/widget/Sign/TextFormField.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controllerImp = Get.put(LoginControllerImp());
    return Theme(
      data: Theme.of(context),
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                HeadLineText(headline: "SIGN IN"),
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
                    "Welcome You can Sign in with your Email an Pass If you Forget Your pass Click on Forget Pass ",
                    style: TextStyle(fontSize: 15, color: colorApp.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormFields(
                  validator: (val){
                    return ValidatorInput("email",val!,6,12);
                  },
                  isNum:false,
                  hint: 'yourEmail@gmail.com',
                  lable: 'Email',
                  icons: Icon(Icons.person),
                  controllerText: controllerImp.email!,
                ),

                GetBuilder<LoginControllerImp>(builder:(controller){
                  return TextFormFields(
                      validator: (val){
                        return ValidatorInput("pass",val!,6,12);
                      },
                      isNum:false,
                      press: controllerImp.Press,
                      onTapIcon: () {
                        controllerImp.showPass();
                      },
                      icons2: Icon(Icons.visibility_off),
                      hint: '',
                      lable: 'Password',
                      icons: Icon(Icons.remove_red_eye),
                      controllerText: controllerImp.password!
                  );
                } ),

                Container(
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.topRight,
                    child: TextButton(onPressed: () {
                      controllerImp.goToForget();
                    },
                      child: Text("Forget Pass?",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: colorApp.primary,
                              fontSize: 15,
                              decoration: TextDecoration.underline)),
                    )),
                SizedBox(
                  height: 10,
                ),
                ButtonInSign(
                  textbutton: 'Login', onPressed: () {
                  controllerImp.login();
                },
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Text("Don't Have an Account ",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: colorApp.grey, fontSize: 15))),
                    Container(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: TextButton(
                            onPressed: () {
                              print("Got ot Sig up");
                              controllerImp.goToSignUp();
                            },
                            child: Text(
                              "Sign Up",
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
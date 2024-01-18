import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurantapp/controller/Auth/SignUpController.dart';
import 'package:restaurantapp/core/const/color.dart';
import 'package:restaurantapp/core/functions/ValidatorInput.dart';
import 'package:restaurantapp/core/functions/alertExitApp.dart';
import 'package:restaurantapp/core/shared/HandlingWidgets.dart';
import 'package:restaurantapp/view/widget/Shared/ButtonInSign.dart';
import 'package:restaurantapp/view/widget/Shared/HeadLineText.dart';
import 'package:restaurantapp/view/widget/Sign/TextFormField.dart';
import 'package:restaurantapp/core/class/crud.dart';
class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Theme(
      data: Theme.of(context),
      child: Scaffold(
        body:WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
            builder: (controllerImp){
              return HandlingWidets(
                status: controllerImp.status,
                  widget:  Container(
                    child: Form(
                      key: controllerImp.formstate,
                      child: ListView(
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
                                  style: TextStyle(fontSize: 15, color: colorApp.grey),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              TextFormFields(
                                validator: (val) {
                                  return ValidatorInput("name", val!, 6, 12);
                                },
                                isNum: false,
                                hint: '',
                                lable: 'Name',
                                icons: Icon(Icons.person),
                                controllerText: controllerImp.userName!,
                              ),
                              TextFormFields(
                                validator: (val) {
                                  return ValidatorInput("email", val!, 6, 30);
                                },
                                isNum: false,
                                hint: 'yourEmail@gmail.com',
                                lable: 'Email',
                                icons: Icon(Icons.alternate_email),
                                controllerText: controllerImp.email!,
                              ),
                              TextFormFields(
                                validator: (val) {
                                  return ValidatorInput("phone", val!, 6, 12);
                                },
                                isNum: true,
                                hint: '',
                                lable: 'Phone Number',
                                icons: Icon(Icons.phone_android),
                                controllerText: controllerImp.phone!,
                              ),
                              GetBuilder<SignUpControllerImp>(builder: (controller) {
                                return TextFormFields(
                                    validator: (val) {
                                      return ValidatorInput("pass", val!, 6, 12);
                                    },
                                    isNum: false,
                                    press: controllerImp.Press,
                                    onTapIcon: () {
                                      controllerImp.showPass();
                                    },
                                    icons2: Icon(Icons.visibility_off),
                                    hint: '',
                                    lable: 'Password',
                                    icons: Icon(Icons.remove_red_eye),
                                    controllerText: controllerImp.password!);
                              }),

                              SizedBox(
                                height: 10,
                              ),
                              ButtonInSign(
                                textbutton: 'Sign Up',
                                onPressed: () => controllerImp.SignUp(),
                              ),
                              Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(left: 10, top: 20),
                                      child: Text("Have an Account ",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: colorApp.grey, fontSize: 15))),
                                  Container(
                                      padding: EdgeInsets.only(left: 10, top: 20),
                                      child: TextButton(
                                          onPressed: () {
                                            controllerImp.goToLogin();
                                          },
                                          child: Text(
                                            "Log in",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: colorApp.primary, fontSize: 15),
                                          ))),
                                ],
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                  ));
            },
          ),
        )
      ),
    );
  }
}
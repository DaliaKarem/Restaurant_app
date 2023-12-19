import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurantapp/controller/Auth/Forget&Success/ResetPassController.dart';
import 'package:restaurantapp/core/functions/ValidatorText.dart';
import 'package:restaurantapp/view/widget/Shared/BodyText.dart';
import 'package:restaurantapp/view/widget/Shared/ButtonInSign.dart';
import 'package:restaurantapp/view/widget/Shared/HeadLineText.dart';
import 'package:restaurantapp/view/widget/Sign/TextFormField.dart';
import 'package:restaurantapp/view/widget/StartPage/BodyText.dart';

class ResetPass extends StatelessWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPassControllerImp());
    return Scaffold(
      body: GetBuilder<ResetPassControllerImp>(
        builder: (controler){
          return Column(
            children: [
              SizedBox(height: 50,),
              HeadLineText(headline: "Reset PassWord"),
              SizedBox(height: 20,),

              BodyTextForSign(bodyText: 'Enter New Password',),
              SizedBox(height: 60,),
              GetBuilder<ResetPassControllerImp>(builder: (controller){
                return  TextFormFields(
                  isNum: false,
                  press: controller.Press,
                  onTapIcon:(){
                    controller.ShowPass();
                  } ,
                  validator: (val){
                    return ValidatorInput("pass",val! , 8, 15);
                  },
                  lable: "Password",
                  hint: "Enter Password",
                  icons: Icon(Icons.visibility),
                  icons2: Icon(Icons.visibility_off),
                  controllerText: controller.Pass ,);

              }),


              GetBuilder<ResetPassControllerImp>(builder: (controller){
                return  TextFormFields(
                  isNum: false,
                  press: controller.Press,
                  onTapIcon:(){
                    controller.ShowPass();
                  } ,
                  validator: (val){
                    return ValidatorInput("pass",val! , 8, 15);
                  },
                  lable: "rePassword",
                  hint: "Enter Password",
                  icons: Icon(Icons.visibility),
                  icons2: Icon(Icons.visibility_off),
                  controllerText: controller.rePass ,);

              }),
              ButtonInSign(textbutton: 'Done', onPressed: () {
                controler.gotoSuccess();
              },),

            ],
          );
        },
      ),
    );
  }
}

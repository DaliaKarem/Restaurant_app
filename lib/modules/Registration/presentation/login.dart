import 'package:flutter/material.dart';
import 'package:restaurantapp/core/Function/DataBaseFun.dart';
import 'package:restaurantapp/core/Function/Valid.dart';
import 'package:restaurantapp/core/Links.dart';
import 'package:restaurantapp/core/Widgets/clip.dart';
import 'package:restaurantapp/core/Widgets/textfield.dart';
import 'package:restaurantapp/main.dart';
import 'package:restaurantapp/models/User.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  GlobalKey<FormState> formstate=GlobalKey();
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
  DataBaseFun fun=DataBaseFun();
  login()async{
   if(formstate.currentState!.validate())
     {
       var res=await fun.postReq(LoginLink ,{
         "email":email.text,
         "pass":pass.text
       });
       if(res['status']=="success")
       {

         sharedPreferences.setString("user_id", res['data']['user_id'].toString());
         sharedPreferences.setString("user_name", res['data']['user_name']);
         sharedPreferences.setString("user_email", res['data']['user_email']);
         sharedPreferences.setString("user_img", res['data']['user_img']);
         Navigator.of(context).pushNamedAndRemoveUntil("Home", (route) => false);
       }
       else{
         return AlertDialog(
           title: const Text('Error'),
           content: const Text('this Email signed up before'),
           actions: <Widget>[
             TextButton(
               onPressed: () => Navigator.pop(context, 'Cancel'),
               child: const Text('Cancel'),
             ),
             TextButton(
               onPressed: () => Navigator.pop(context, 'OK'),
               child: const Text('OK'),
             ),
           ],
         );
       }
     }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[350],
        child: Form(
          key: formstate,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 450),
                      color: Colors.black.withOpacity(.8),
                      height: 220,
                      alignment: Alignment.center,

                    ),
                  ),
                  ClipPath(
                    clipper: WaveClipper(waveDeep: 0, waveDeep2: 100 ),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 50),
                      color: Colors.black.withOpacity(.5),
                      height: 180,
                      alignment: Alignment.center,

                    ),
                  ),
                ],
              ),
              Container(height: 30,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomTextForm(hint: "Enter Email", mycontroller: email, validator: (val){
                  validInput(val!, 8, 20);
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomTextForm(hint: "Enter Password", mycontroller: pass, validator: (val){
                  validInput(val!, 8, 20);
                }),
              ),
              MaterialButton(onPressed: ()async{
                await login();
              },
              color: Colors.grey,
                textColor: Colors.white,
                child: Text("Login"),
              ),
             Padding(
               padding: const EdgeInsets.only(left:20),
               child: Row(
                 children: [
                   Text("Don't have an account "),
                   TextButton(onPressed: (){
                     Navigator.of(context).pushReplacementNamed("signup");
                   }, child: Text("Sign up"))

                 ],
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}

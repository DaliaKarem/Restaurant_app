import 'package:flutter/material.dart';
import 'package:restaurantapp/core/Function/Valid.dart';
import 'package:restaurantapp/core/Widgets/clip.dart';
import 'package:restaurantapp/core/Widgets/textfield.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  GlobalKey<FormState> formstate=GlobalKey();
  TextEditingController email=TextEditingController();
  TextEditingController pass=TextEditingController();
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
              MaterialButton(onPressed: (){
                Navigator.of(context).pushNamed("Home");
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

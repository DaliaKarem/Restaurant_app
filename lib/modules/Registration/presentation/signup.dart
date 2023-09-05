import 'package:flutter/material.dart';
import 'package:restaurantapp/core/Function/Valid.dart';
import 'package:restaurantapp/core/Widgets/clip.dart';
import 'package:restaurantapp/core/Widgets/textfield.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formstate=GlobalKey();
  TextEditingController name=TextEditingController();
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
                child: CustomTextForm(hint: "Enter Name", mycontroller: name, validator: (val){
                  validInput(val!, 2,10);
                }),
              ),
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
                Navigator.of(context).pushNamed("login");
              },
                color: Colors.grey,
                textColor: Colors.white,
                child: Text("Sign Up"),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20),
                child: Row(
                  children: [
                    Text("already have an account "),
                    TextButton(onPressed: (){
                      Navigator.of(context).pushReplacementNamed("login");
                    }, child: Text("login"))

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

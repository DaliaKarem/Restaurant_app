import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurantapp/core/Function/DataBaseFun.dart';
import 'package:restaurantapp/core/Function/Valid.dart';
import 'package:restaurantapp/core/Links.dart';
import 'package:restaurantapp/core/Widgets/clip.dart';
import 'package:restaurantapp/core/Widgets/textfield.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  DataBaseFun fun = DataBaseFun();
  File? file;

  signup() async {

    if (formstate.currentState!.validate()) {
      var res = await fun.postReqUser(
          SignLink,
          {
            "name": name.text,
            "email": email.text,
            "pass": pass.text,
          },
          file!);
      if (res['status'] == "success") {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Success() as String, (route) => false);
      } else {
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
        print("SignUp fail");
      }
    }
    if (file == null) {
      return AwesomeDialog(
          context: context, title: 'Error', desc: "You have to upload photo")
        ..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                        color: Colors.blue.withOpacity(.8),
                        height: 220,
                        alignment: Alignment.center,
                      ),
                    ),
                    ClipPath(
                      clipper: WaveClipper(waveDeep: 0, waveDeep2: 100),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 50),
                        color: Colors.blue.withOpacity(.5),
                        height: 180,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomTextForm(
                      hint: "Enter Name",
                      mycontroller: name,
                      validator: (val) {
                        validInput(val!, 2, 10);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomTextForm(
                      hint: "Enter Email",
                      mycontroller: email,
                      validator: (val) {
                        validInput(val!, 8, 20);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomTextForm(
                      hint: "Enter Password",
                      mycontroller: pass,
                      validator: (val) {
                        validInput(val!, 8, 20);
                      }),
                ),
                MaterialButton(
                  onPressed: () async {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 100,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  XFile? xfile = await ImagePicker()
                                      .pickImage(
                                      source: ImageSource.gallery);
                                  Navigator.of(context).pop();
                                  file = File(xfile!.path);
                                  setState(() {});
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  child: Text(" from Galary"),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  XFile? xfile = await ImagePicker()
                                      .pickImage(
                                      source: ImageSource.camera);
                                  Navigator.of(context).pop();
                                  file = File(xfile!.path);
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  child: Text("from Camera"),
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                  child: Text("choose image"),
                  textColor: Colors.white,
                  color: file == null ? Colors.blue.shade900 : Colors.lightBlue,
                ),
                MaterialButton(

                  onPressed: () async {
                    print("file is:    $file");
                    await signup();
                  },
                  child: Text("Sign Up"),
                  textColor: Colors.white,
                  color: Colors.blue,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text("already have an account "),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed("login");
                          },
                          child: Text("login"))
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      )
    );
  }

  AwesomeDialog Success() {
    return AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.info,
      body: Center(
        child: Text(
          'You are sign up correctly	',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      title: 'Success',
      btnOkOnPress: () {
        Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
      },
    )..show();

}
}

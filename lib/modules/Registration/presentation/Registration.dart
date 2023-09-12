import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Reg extends StatefulWidget {
  const Reg({Key? key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0,right: 10,left: 10),
            child: Text("Welcome To Our Restaurant",style: GoogleFonts.pacifico(fontStyle: FontStyle.italic,color: Colors.lightBlue,fontSize: 30),),
          ),

          Container(
            height: 400,
            child: Image.network("https://cdni.iconscout.com/illustration/premium/thumb/order-food-by-mobile-4119521-3418350.png"),
    ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("signup");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.lightBlue,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("login");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.lightBlue,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: const Text(
                      'Log in',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}

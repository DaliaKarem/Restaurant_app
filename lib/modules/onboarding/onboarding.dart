import 'package:flutter/material.dart';
import 'package:restaurantapp/modules/Registration/presentation/Registration.dart';

class onboarding extends StatelessWidget {
  const onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DesignStartPage(
        image: "assets/onboarding/start.png",
        title: "Order your Favourites ",
        content: "When you order Eat Street, we'll book you up with exclusive coupons, special sand rewards",
        onpress: DesignStartPage(
          image: "assets/onboarding/cart.png",
          title: "Select from Our Best Menu ",
          content: "Pick your food from our menu More than 35 items",
          onpress: DesignStartPage(
            image: "assets/onboarding/delivery.png",
            title: "Pick up or delivery ",
            content: "We make food ordering fast,simple and free - no matter if you order online or cash",
            onpress: Reg(),
          ),
        ),
      ),
    );
  }
}

class DesignStartPage extends StatefulWidget {
  DesignStartPage(
      {Key? key,
      required this.image,
      required this.title,
      required this.content,
      required this.onpress})
      : super(key: key);
  String image, content, title;
  Widget onpress;

  @override
  State<DesignStartPage> createState() => _DesignStartPageState();
}

class _DesignStartPageState extends State<DesignStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (BuildContext context) => Reg()),
                  );
                },
                child: Text(
                  "Skip",style: TextStyle(fontSize: 20),
                ),
              )),
        ),
        Container(
          width: double.infinity,
          height: 400,
          child: Image.asset(widget.image),
        ),
             SizedBox(height: 50,),
             Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(widget.content),
            ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              shadowColor: Colors.lightBlue,
                primary: Colors.lightBlue,
                //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),

            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (BuildContext context) => widget.onpress),
              );
            },
            child: Text("Next"))
      ])),
    );
  }
}

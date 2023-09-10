import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
class Pay extends StatelessWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () { Navigator.of(context).pop(); },
        ),
        title: Text("Avaliabe Offers",style: TextStyle(color: Colors.black),),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              payment(content: "Get flat 5% paypl cashback on yor 1s paypal order", img: "https://fatora.io/wp-content/uploads/2020/12/%D8%A8%D9%8A%D8%A8%D8%A7%D9%84-paypal-3.png", code: "3PP100"),
              payment(content: "if you use VISA ill get offer 15% VISA orders", img: "https://1000logos.net/wp-content/uploads/2021/11/VISA-logo.png", code: "FF1488")
            ],
          ),
        ],
      )
    );
  }
}
class payment extends StatelessWidget {
   payment({Key? key,required this.content,required this.img,required this.code}) : super(key: key);
  String code,content,img;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: new BorderRadius.only(
            topLeft: new Radius.circular(50),
            bottomLeft: new Radius.circular(50),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 10),child:Image.network(img,width: 150,height: 50,fit: BoxFit.cover,), ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(content,style: TextStyle(fontSize: 18),),
            ),
            Divider(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 50,
              child: DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: [10, 10],
                  color: Colors.red,
                  strokeWidth: 2,
                  child: Center(child:Text(code)),
            )),
            Spacer(),
            TextButton(onPressed: (){}, child:Text("Tap to continue",style: TextStyle(color: Colors.red),))
          ],
        ),
      )
          ],
        ),
      ),
    );
  }
}

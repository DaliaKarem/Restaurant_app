import 'package:flutter/material.dart';
import 'package:restaurantapp/core/Widgets/Count.dart';
import 'package:restaurantapp/modules/Cart/presentation/PayPage.dart';
class cartItem extends StatefulWidget {
  const cartItem({Key? key}) : super(key: key);

  @override
  State<cartItem> createState() => _cartItemState();
}

class _cartItemState extends State<cartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Pizza",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
             Count(),
            ],
          ),
          Padding(padding: EdgeInsets.only(right: 300), child: Text("\$200")),
          Padding(
              padding: EdgeInsets.only(right: 150),
              child: Text("here we will writee decription")),
          Divider(),
        ],
      ),
    );
  }
}


class totalPrice extends StatelessWidget {
  const totalPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: [
              Text("item total"),
              Spacer(),
              Text("\$122"),
            ],),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: [
              Text("Delvery Charg "),
              Spacer(),
              Text("\$100"),
            ],),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: [
              Text("Taxs and chargrs"),
              Spacer(),
              Text("\$0.99"),
            ],),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: [
              Text("Voucher Discount",style: TextStyle(color: Colors.orange),),
              Spacer(),
              Text("- \$0",style: TextStyle(color: Colors.orange),),
            ],),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: [
              Text("total to pay"),
              Spacer(),
              Text("\$150"),
            ],),
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Pay();
            }));
          }, child: Text("Procceed to pay"),style: ElevatedButton.styleFrom(
            backgroundColor:Colors.orange ,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),

          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:restaurantapp/core/Widgets/CartItems.dart';
import 'package:restaurantapp/modules/Home/presentaion/HomePage.dart';
import 'package:restaurantapp/modules/Home/presentaion/trendingFood/trendingFood.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Positioned(
                top: 10,
                left: 0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )),
            Text(
              "Your Cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.orange,
                  ),
                  Text("Deliver to"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Your address",
                      style: TextStyle(color: Colors.orange),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Row(
              children: [
                TrendingFood(),
                Icon(Icons.lock_clock),
                Text("20 min")
              ],
            ),
            Divider(),
            cartItem(),
            MaterialButton(
              onPressed: () {},
              child: Text("Open Menu"),
              color: Colors.red,
              textColor: Colors.white,
            ),
            totalPrice()
          ],
        ),
      ],
    ));
  }
}

import 'package:flutter/material.dart';
class Count extends StatefulWidget {
  const Count({Key? key}) : super(key: key);

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 140,
      height: 30,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.minimize,
                size: 10,
              )),
          VerticalDivider(
            width: 3,
            thickness: 2,
            indent: 5,
            endIndent: 0,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0, right: 2),
            child: Text("01"),
          ),
          VerticalDivider(
            width: 3,
            thickness: 2,
            indent: 5,
            endIndent: 0,
            color: Colors.grey,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.minimize,
                size: 10,
              )),
        ],
      ),
    );
  }
}
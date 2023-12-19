import 'package:flutter/material.dart';
class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test"),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Container(
          child: ListView(
            children: [],
          ),
        ),
      ),
    );
  }
}

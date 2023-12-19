import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  BodyText({Key? key, required this.textBody}) : super(key: key);
  String? textBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        textBody!,
        style: TextStyle(fontSize: 15, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
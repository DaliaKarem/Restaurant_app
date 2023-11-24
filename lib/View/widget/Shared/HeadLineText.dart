import 'package:flutter/material.dart';
class HeadLineText extends StatelessWidget {
  HeadLineText({Key? key, required this.headline, this.toppaddng}) : super(key: key);

  String? headline;
  double? toppaddng;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: toppaddng ?? 30),
      child: Text(
        headline!,
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,
      ),
    );
  }
}

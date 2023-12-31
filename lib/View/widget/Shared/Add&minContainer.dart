import 'package:flutter/material.dart';
class AddMinConatiner extends StatelessWidget {
  const AddMinConatiner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(width: 30,height: 30,child:  IconButton(onPressed: (){}, icon: Icon(Icons.remove)),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),),
      Text("1"),
      Container(width: 30,height: 30,child:  IconButton(onPressed: (){}, icon: Icon(Icons.add)),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white),),

    ],);
  }
}

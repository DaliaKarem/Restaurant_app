import 'package:flutter/material.dart';
import 'package:restaurantapp/core/Function/DataBaseFun.dart';


Map<String, String> categories = {
  "Rice":
  "https://thewanderlustkitchen.com/wp-content/uploads/2013/12/Perfect-White-Rice-Recipe-Redo-17-2.jpg",
  "salad":
  "https://assets.bonappetit.com/photos/5e8cdb60a7a01c00083b08a9/1:1/w_2560%2Cc_limit/HMONG-Potluck-Chopped-Salad.jpg",
  "Pizza":
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8RLmb-KVvMp4jqqvMGM0Yj3aloC06vFgbPoRwJLCAp9_kT3XNVBUCctw37_HdV2Cf9GM&usqp=CAU",
  "Burger":
  "https://i.pinimg.com/736x/c1/2f/63/c12f634360e34070360095307bd0ab9a--best-burger-restaurants-diet-detox.jpg",
  "Pasta":
      "https://www.budgetbytes.com/wp-content/uploads/2013/07/Creamy-Spinach-Tomato-Pasta-bowl-500x500.jpg"
};


class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}
List<String> value = [];
List<String> key = [];

class _categoryState extends State<category> {

  @override
  Widget build(BuildContext context) {
    for (var item in categories.entries) {
      value.add(item.value);
      key.add(item.key);
    }
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                height: 50,
                width: 60,
                child: Image.network(value[i]),
              ),
              Text("${key[i]}")
            ],
          );
        });
  }
}
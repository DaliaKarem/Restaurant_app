import 'package:flutter/material.dart';
import 'package:restaurantapp/core/Function/DataBaseFun.dart';
import 'package:restaurantapp/core/Links.dart';
import 'package:restaurantapp/core/Widgets/DrawerBar.dart';
import 'package:restaurantapp/core/Widgets/Search.dart';
import 'package:restaurantapp/main.dart';
import 'package:restaurantapp/models/User.dart';
import 'package:restaurantapp/modules/Home/presentaion/Category/category.dart';
import 'package:restaurantapp/modules/Home/presentaion/trendingFood/trendingFood.dart';

List<String> images = [
  "https://img.freepik.com/premium-photo/italian-food-with-ingredients_1220-4675.jpg?w=360",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrUGOvs4nW3bWL0J-64vQtCkjBTnP6Yh3qrQ&usqp=CAU"
];
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer:DrawerBar(),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          IconButton(onPressed: (){
            sharedPreferences.clear();
            Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
          }, icon: Icon(Icons.exit_to_app))
        ],),
      body: ListView(
        children: [
          Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                Search(),
                Container(
                    padding: EdgeInsets.all(10),
                    // margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 200,
                    child: ImagesTop()),
                Row(
                  children: [
                    Text(
                      "Top Categories",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "View All",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.grey,
                              fontSize: 15),
                        ))
                  ],
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed("Product");
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      // margin: const EdgeInsets.symmetric(vertical: 20),
                      height: 100,
                      child: category()),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Trending food",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "View All",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.grey,
                              fontSize: 15),
                        ))
                  ],
                ),
                InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed("ProductDetails");
                    },
                    child: TrendingFood()),
                TrendingFood(),
                TrendingFood(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImagesTop extends StatelessWidget {
  const ImagesTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, i) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            height: 300,
            width: 280,
            child: Image.network(images[i]),
          );
        });
  }
}

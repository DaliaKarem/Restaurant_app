import 'package:flutter/material.dart';
import 'package:restaurantapp/core/Function/DataBaseFun.dart';
import 'package:restaurantapp/core/Links.dart';
import 'package:restaurantapp/core/Widgets/DrawerBar.dart';
import 'package:restaurantapp/core/Widgets/Search.dart';
import 'package:restaurantapp/main.dart';
import 'package:restaurantapp/models/User.dart';

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

List<String> images = [
  "https://img.freepik.com/premium-photo/italian-food-with-ingredients_1220-4675.jpg?w=360",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrUGOvs4nW3bWL0J-64vQtCkjBTnP6Yh3qrQ&usqp=CAU"
];
Map<String, String> categories = {
  "Rice":
      "https://thewanderlustkitchen.com/wp-content/uploads/2013/12/Perfect-White-Rice-Recipe-Redo-17-2.jpg",
  "salad":
      "https://assets.bonappetit.com/photos/5e8cdb60a7a01c00083b08a9/1:1/w_2560%2Cc_limit/HMONG-Potluck-Chopped-Salad.jpg",
  "Juice":
      "https://sandhyahariharan.co.uk/wp-content/uploads/2011/05/homemade-pineapple-juice-7-of-7.jpg",
  "Fast Food":
      "https://cdn.altibbi.com/cdn/cache/1000x500/image/2020/09/20/a6bde2d7cdebb8f990a13652abcc183e.jpg.webp"
};
List<String> value = [];
List<String> key = [];

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

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

class TrendingFood extends StatefulWidget {
  const TrendingFood({Key? key}) : super(key: key);

  @override
  State<TrendingFood> createState() => _TrendingFoodState();
}

class _TrendingFoodState extends State<TrendingFood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Image.network("https://media.istockphoto.com/id/1142277472/photo/pizza-slice-melted-cheese.jpg?s=612x612&w=0&k=20&c=A-4fSg0RvB1Jklaa48g_O1Q1JbemJ-oQDxzmc2A43mA=",width: 100,height: 100,),
                Positioned(left: 0,top: 0,child: Container(color: Colors.yellow,child: Text("5% off"),width: 50,height: 20,))
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Dal Tadka",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
              Container(
                width: 250,
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  'It is a long established fact that a reader will be gggggggggg ggggggggg.',
                  style: TextStyle(fontSize: 10),
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // new
                ),
              ),
              TextButton(onPressed: (){}, child: Text("Read more")),
            ],
          ),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:restaurantapp/core/Function/DataBaseFun.dart';
import 'package:restaurantapp/core/Links.dart';
import 'package:restaurantapp/modules/Home/presentaion/Category/ProductDetails.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  DataBaseFun fun = DataBaseFun();

  getData() async {
    var response = await fun.getReq(allFood);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          ],
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data['status'] != 'success') {
                return Text("Failll");
              } else {
                return ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Categories(),

                          // ListView.builder(
                          //     itemCount: categories.length,
                          //     itemBuilder: (item,i){
                          //       Categories(cat:snapshot.data['data'][i]['order_category']);
                          //     }),
                          SizedBox(
                            height: 1000,
                            child: GridView.builder(
                                itemCount: snapshot.data['data'].length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemBuilder: (context, i) => Item(
                                      pressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ProductDetails(
                                                  name: snapshot.data['data'][i]
                                                      ['order_name'],
                                                  cat:snapshot.data['data'][i]
                                                  ['order_category'],
                                                  image: snapshot.data['data']
                                                      [i]['order_img'],
                                                  content: snapshot.data['data']
                                                      [i]['order_content'],
                                                  // count: snapshot.data['data'][i]
                                                  //     ['order_count'],
                                                  // price: snapshot.data['data']
                                                  //     [i]['order_price'],
                                                  // rating: snapshot.data['data']
                                                  //     [i]['rating']
                                              ))),
                                      name: snapshot.data['data'][i]
                                          ['order_name'],
                                      image: snapshot.data['data'][i]
                                          ['order_img'],
                                    )),
                          )
                        ]),
                  ],
                );
              }
            }
            return Text("Errrrrrrrrrrrrrrrrrror");
          },
        ));
  }
}

class Categories extends StatefulWidget {
  Categories({Key? key}) : super(key: key);

  //String cat;
  @override
  State<Categories> createState() => _CategoriesState();
}

List<String> categories = ['Rice', 'salad', 'Pizza', 'Burger', 'Pasta'];

class _CategoriesState extends State<Categories> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, i) {
              return buildcategory(i);
            }),
      ),
    );
  }

  Widget buildcategory(int index) {
    // for(int i=0;i<categories.length;i++){
    //   if(categories.contains(cat))
    //     {
    //       print(i);
    //     }
    //   index=i;
    // }
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selected == index ? Colors.black : Colors.grey),
            ),
            Container(
              height: 2,
              width: 30,
              color: selected == index ? Colors.black : Colors.transparent,
              margin: EdgeInsets.only(top: 5),
            )
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  Item(
      {Key? key,
      required this.pressed,
      required this.name,
      required this.image})
      : super(key: key);
  final void Function()? pressed;
  String image, name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            // color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              //" $linkImage/$image",
              "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80",
              width: 200, height: 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name),
            )
          ],
        ),
      ),
    );
  }
}

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
      body:  FutureBuilder(
            future: getData(),
            builder: (BuildContext context,
                AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data['status'] != 'success') {
                  return Text("Failll");
                }
                else {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                       ListView.builder(
                         itemCount: categories.length,
                           itemBuilder: (item,i){
                         Categories(cat:snapshot.data['data'][i]['order_category']);
                       }),
                        GridView.builder(
                            itemCount: snapshot.data['data'].length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, i) =>
                                Item(pressed: () => Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetails())), name: snapshot.data['data'][i]['order_name'], image:snapshot.data['data'][i]['order_img'],
                                )),
               ]
                  )   ;
              }

              }
              return Text("Errrrrrrrrrrrrrrrrrror");
            },

          )

     );
  }
}

class Categories extends StatefulWidget {
   Categories({Key? key,required this.cat}) : super(key: key);
   String cat;
  @override
  State<Categories> createState() => _CategoriesState();
}
List<String> categories = ['Rice', 'salad', 'Pizza','Burger','Pasta'];

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
              return buildcategory(i,widget.cat);
            }),
      ),
    );
  }

  Widget buildcategory(int index,String cat) {
    for(int i=0;i<categories.length;i++){
      if(categories.contains(cat))
        {
          print(i);
        }
      index=i;
    }
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
      {Key? key, required this.pressed, required this.name, required this.image})
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
              " $linkImage/$image",
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

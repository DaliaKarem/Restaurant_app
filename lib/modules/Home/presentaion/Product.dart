import 'package:flutter/material.dart';
import 'package:restaurantapp/modules/Home/presentaion/ProductDetails.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Categories(),
          Expanded(
              child: GridView.builder(
                itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                   ),
                  itemBuilder: (context, i) => Item(pressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails())),))),
        ],
      ),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ['Rice', 'Juice', 'fast food'];
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
   Item({Key? key,required this.pressed}) : super(key: key);
  final void Function()? pressed;
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
              "https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/07/1296x728-header.jpg?w=1155&h=1528",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Pasta with white souce"),
            )
          ],
        ),
      ),
    );
  }
}

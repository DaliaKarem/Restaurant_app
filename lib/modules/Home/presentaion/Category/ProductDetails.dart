import 'package:flutter/material.dart';
import 'package:restaurantapp/core/Widgets/Count.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({
    Key? key,
    this.name,
    this.cat,
    this.image,
    this.content,
    //this.count,
    //this.price,
    //this.rating,
  }) : super(key: key);

  String? name, cat, image, content;
  int?  rating;
  int? price;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}
class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.grey,
        body: ListView(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Image.network(
                  "https://i0.wp.com/post.healthline.com/wp-content/uploads/2020/07/1296x728-header.jpg?w=1155&h=1528",
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            BodyDetailProduct(name:widget.name,image:widget.image,content:widget.content,)
          ],
        ),
      ],
    ));
  }
}

class BodyDetailProduct extends StatelessWidget {
   BodyDetailProduct({Key? key,this.name,
    //this.cat,
    this.image,
    this.content,}) : super(key: key);

  String? name, cat, image, content;
  int?  rating;
  int? price;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("$name"),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("price : $price" ),
              ),
              Count(),
            ],
          ),
          Text("$content"),
          Center(
            child: MaterialButton(
              onPressed: () {},
              child: Text("Order Now"),
              color: Colors.red,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

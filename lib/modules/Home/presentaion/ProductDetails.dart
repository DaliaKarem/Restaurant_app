import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // backgroundColor: Colors.grey,
        body:
      ListView(
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
                    top:20,
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back,color: Colors.black,),
                    ),),
                ],
              ),
              BodyDetailProduct()
            ],
          ),
        ],
      )
    );
  }
}

class BodyDetailProduct extends StatelessWidget {
  const BodyDetailProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 500,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100),
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)
                    )
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("ProductName"),
                          Text("1100")
                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

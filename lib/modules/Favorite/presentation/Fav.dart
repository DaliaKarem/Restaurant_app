import 'package:flutter/material.dart';
import 'package:flutter/src/material/dialog.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:restaurantapp/core/Function/DataBaseFun.dart';
import 'package:restaurantapp/core/Links.dart';
import 'package:restaurantapp/main.dart';
import 'package:restaurantapp/modules/Home/presentaion/Category/ProductDetails.dart';

class Fav extends StatefulWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  DataBaseFun fun = DataBaseFun();
  bool onpress = true;

  getfav() async {
    var res = await fun.postReq(viewfav, {
      "user": sharedPreferences.getString("user_id"),
    });
    print("kkkkkkkkkkkkkk$res");
    if (res['status'] == "success") {
      return res;
    } else {
      return Text("errrrr");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(
            "Favorites",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: FutureBuilder(
            future: getfav(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                    child: ListView.builder(
                        itemCount: snapshot.data['data'].length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return ProductDetails(
                                  name: snapshot.data['data'][index]
                                      ['order_name'],
                                  cat: snapshot.data['data'][index]
                                      ['order_cat'],
                                  image: snapshot.data['data'][index]
                                      ['order_img'],
                                  content: snapshot.data['data'][index]
                                      ['order_content'],
                                );
                              }));
                            },
                            child: Card(
                              elevation: 10,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://img.freepik.com/free-photo/double-hamburger-isolated-white-background-fresh-burger-fast-food-with-beef-cream-cheese_90220-1192.jpg"),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 7.0,
                                                color: Colors.black)
                                          ]),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0,
                                                right: 50,
                                                bottom: 10),
                                            child: Text(
                                              "${snapshot.data['data'][index]['order_name']}",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () async{
                                                setState(() {
                                                  onpress=false;
                                                });
                                                var res=await fun.postReq(removefav, {
                                                  "user":sharedPreferences.getString("id"),
                                                  "order":snapshot.data['data'][index]['order_id']
                                                });print("jjjjjjjjjjjjjjjjjjjjjjjjjj");
                                                print("vvvvvvvvvvvvjnj  ${snapshot.data['data'][index]['order_id']}");
                                                setState(() {

                                                });
                                                  Navigator.of(context).pushReplacementNamed("Fav");
                                              },
                                              icon: Icon(
                                                Icons.favorite,
                                                color:(onpress==true)?Colors.red:Colors.black ,
                                              ))
                                        ],
                                      ),
                                      RatingBar.builder(
                                        itemSize: 20,
                                        initialRating: double.parse(snapshot
                                            .data['data'][index]['rating']),
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                      Text(
                                          "Price : \$${snapshot.data['data'][index]['order_price']}")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }));
              }
            }));
  }
}

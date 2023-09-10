import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapp/core/Function/DataBaseFun.dart';
import 'package:restaurantapp/core/Links.dart';
import 'package:restaurantapp/main.dart';
import 'package:restaurantapp/models/User.dart';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';

class DrawerBar extends StatelessWidget {
   DrawerBar({Key? key}) : super(key: key);
   DataBaseFun fun=DataBaseFun();
   getdata()async
  {
    print("/////////////////////");

    var res=await fun.postReq(getdataLink ,{
      "user_id":sharedPreferences.getString("user_id"),
    });
    if(res['status']=="success")
    {
      print("//////////////////");
      print(res);
      return res;
    }

    else{
      return AlertDialog(
        title: const Text('Error'),
        content: const Text('this Email signed up before'),
      );
    }
    print(res);
  }
  @override
  Widget build(BuildContext context) {
    return    Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child:CachedNetworkImage(
                    imageUrl: "$linkImage/${sharedPreferences.getString('user_img')}",
                    placeholder: (context, url) => new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
                  //Image.network("$linkImage/${sharedPreferences.getString('user_img')}",width: 100,height: 100,fit: BoxFit.cover,) ,
                  
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                // image: DecorationImage(
                //   image: NetworkImage(""),
                //
                // )
              ),
              accountName: Text("${sharedPreferences.getString('user_name')}"), accountEmail: Text("${sharedPreferences.getString('user_email')}")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: ()=>Navigator.of(context).pushNamed("Home")
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("favorite"),

            onTap: ()=>Navigator.of(context).pushNamed("Fav"),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(child: Text("5",style: TextStyle(color: Colors.white,fontSize: 12),)),
              ),
            ),
            onTap: ()=>Navigator.of(context).pushNamed("Cart"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settngs"),

            onTap: ()=>Navigator.of(context).pushNamed("Settings"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Exit"),
            onTap: ()=>exit(0),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DrawerBar extends StatelessWidget {
  const DrawerBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child:Image.network("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80",width: 100,height: 100,fit: BoxFit.cover,) ,
              ),
            ),
              decoration: BoxDecoration(
                color: Colors.grey,
                // image: DecorationImage(
                //   image: NetworkImage(""),
                //
                // )
              ),
              accountName: Text("hmed"), accountEmail: Text("accountEmail")),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),

            onTap: ()=>print("fav"),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("favorite"),

            onTap: ()=>print("fav"),
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
            onTap: ()=>print("fav"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settngs"),

            onTap: ()=>print("fav"),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Exit"),
            onTap: ()=>print("fav"),
          ),
        ],
      ),
    );
  }
}

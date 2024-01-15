import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:restaurantapp/DB.dart';

class MongoDB{
  static connect()async{
    var db=await Db.create(MONGO_URL);
    print("opeeeeeeee");
    await db.open();
    print("Open");
    inspect(db);
    print("Error");
    var status=db.serverStatus();
    print("status : ${status} status");
    var collection=db.collection(CONNECTION_URL);
  }
}
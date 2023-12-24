import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:restaurantapp/DB.dart';

class MongoDB{
  static connect()async{
    var db=await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    var status=db.serverStatus();
    var collection=db.collection(CONNECTION_URL);
  }
}
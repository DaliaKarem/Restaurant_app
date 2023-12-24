

import 'package:restaurantapp/Links.dart';
import 'package:restaurantapp/core/class/crud.dart';

class loginData{
  crud _crud;
  loginData(this._crud);
  postData(String email,String pass)async{
    var res=await _crud.postData(linkapp.Login, {
      "email":email,
      "password":pass,
    });
    print(res);
    print(res.fold((l) => l, (r) => r));
    print("////");
    return res.fold((l) => l, (r) => r);
  }
}
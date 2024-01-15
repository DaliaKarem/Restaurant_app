import 'package:restaurantapp/Links.dart';
import 'package:restaurantapp/core/class/crud.dart';
class signUpData{
  crud _crud;
  signUpData(this._crud);
  postData(String name,String email,String pass,String phone)async{
    var res=await _crud.postData(linkapp.Signup, {
          "name":name,
          "email":email,
          "password":pass,
          "phone":phone,
    });
    return res.fold((l) => l, (r) => r);
  }
}
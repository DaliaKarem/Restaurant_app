import 'package:restaurantapp/Links.dart';
import 'package:restaurantapp/core/class/crud.dart';
class CartData{
  crud _crud;
  CartData(this._crud);
  addCart(String user,String Rest ,String id)async{
    var res=await _crud.postData(linkapp.Fav , {},queryParams: {
      "user":user,
      "Rest": Rest,
      "id":id,
    });
    return res.fold((l) => l, (r) => r);
  }
  getCart(String user,String Rest)async{
    var res=await _crud.getData(linkapp.Cart,queryParams: {
      "user":user,
       "Rest": Rest
    });
    print("Fav issssss  $res");
    return res.fold((l) => l, (r) => r);
  }
  removeCart(String user,String Rest ,String id)async{
    var res=await _crud.deleteData(linkapp.Fav,{}, queryParams: {
      "user":user,
      "Rest": Rest,
      "id":id,
    });
    return res.fold((l) => l, (r) => r);
  }

}
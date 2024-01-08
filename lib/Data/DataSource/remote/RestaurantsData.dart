import 'package:restaurantapp/Links.dart';
import 'package:restaurantapp/core/class/crud.dart';
class RestaurantsData{
  crud _crud;
  RestaurantsData(this._crud);
  getRestaurants()async{
    var res=await _crud.getData(linkapp.Restaurants);
    print("Res issssss  $res");
    return res.fold((l) => l, (r) => r);
  }

}
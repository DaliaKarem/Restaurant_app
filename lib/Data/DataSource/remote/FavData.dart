import 'package:restaurantapp/Links.dart';
import 'package:restaurantapp/core/class/crud.dart';
class FavData{
  crud _crud;
  FavData(this._crud);
  addFav()async{

  }
  getFav(String user,String Rest)async{
    var res=await _crud.getData(linkapp.Fav,queryParams: {
      "user":user,
       "Rest": Rest
    });
    print("Fav issssss  $res");
    return res.fold((l) => l, (r) => r);
  }
  removeFav()async{

  }

}
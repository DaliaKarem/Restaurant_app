import 'package:restaurantapp/Links.dart';
import 'package:restaurantapp/core/class/crud.dart';
class FavData{
  crud _crud;
  FavData(this._crud);
  addFav(String user,String Rest ,String id)async{
  var res=await _crud.postData(linkapp.Fav , {},queryParams: {
    "user":user,
    "Rest": Rest,
    "id":id,
  });
  return res.fold((l) => l, (r) => r);
  }
  getFav(String user,String Rest)async{
    var res=await _crud.getData(linkapp.Fav,queryParams: {
      "user":user,
       "Rest": Rest
    });
    print("Fav issssss  $res");
    return res.fold((l) => l, (r) => r);
  }
  removeFav(String user,String Rest ,String id)async{
    var res=await _crud.deleteData(linkapp.Fav,{}, queryParams: {
      "user":user,
      "Rest": Rest,
      "id":id,
    });
    return res.fold((l) => l, (r) => r);
  }

}
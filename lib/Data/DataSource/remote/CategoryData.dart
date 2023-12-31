import 'package:restaurantapp/Links.dart';
import 'package:restaurantapp/core/class/crud.dart';
class HomeData{
  crud _crud;
  HomeData(this._crud);
  getCategory()async{
    var res=await _crud.getData(linkapp.Category);
    print("Res issssss  $res");
    return res.fold((l) => l, (r) => r);
  }
  getProduct()async{
    var res=await _crud.getData(linkapp.Products);
    print("Res issssss  $res");
    return res.fold((l) => l, (r) => r);
  }
}
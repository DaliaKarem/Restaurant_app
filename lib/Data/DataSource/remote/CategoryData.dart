import 'package:restaurantapp/Links.dart';
import 'package:restaurantapp/core/class/crud.dart';
class HomeData{
  crud _crud;
  HomeData(this._crud);
  getCategory()async{
    var res=await _crud.getData(linkapp.Category);
    return res.fold((l) => l, (r) => r);
  }
   getProduct(String id) async {
    var res = await _crud.getData(linkapp.Products, pathParam: id );
    return res.fold((l) => l, (r) => r);
  }
}
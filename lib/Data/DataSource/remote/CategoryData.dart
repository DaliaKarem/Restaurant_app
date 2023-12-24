import 'package:restaurantapp/Links.dart';
import 'package:restaurantapp/core/class/crud.dart';
class CategoryData{
  crud _crud;
  CategoryData(this._crud);
  getData()async{
    var res=await _crud.getData(linkapp.Category);
    print("Res issssss  $res");
    return res.fold((l) => l, (r) => r);
  }
}
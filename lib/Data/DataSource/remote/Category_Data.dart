import 'package:restaurantapp/Links.dart';
import 'package:restaurantapp/core/class/crud.dart';

class Category_Data{
  crud _crud;
  Category_Data(this._crud);
  getData()async{
    print("link is ${linkapp.Category}");
    var res=await _crud.postData(linkapp.Category, {});
    print("Res is  ${res}");
    return res.fold((l) => l, (r) => r);
  }
}
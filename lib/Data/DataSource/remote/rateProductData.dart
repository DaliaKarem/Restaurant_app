

import 'package:restaurantapp/Links.dart';
import 'package:restaurantapp/core/class/crud.dart';

class rateProductData{
  crud _crud;
  rateProductData(this._crud);
  postData(double rate,String? Productid)async{
    var res=await _crud.postData(linkapp.Products, {
      "rate":rate.toString(),
    },pathParam: Productid,);
    return res.fold((l) => l, (r) => r);
  }
}
import 'package:restaurantapp/core/class/satusReq.dart';

handlingData(res){
  if(res is statusReq)
    {
      return res;
    }
  else{
    //map
    return statusReq.success;
  }
}
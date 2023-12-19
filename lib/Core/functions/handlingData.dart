import 'package:restaurantapp/core/class/HandlingData.dart';

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
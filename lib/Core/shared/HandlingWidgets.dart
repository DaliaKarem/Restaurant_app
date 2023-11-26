import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurantapp/core/class/HandlingData.dart';
class HandlingWidets extends StatelessWidget {
   HandlingWidets({Key? key,required this.status,required this.widget}) : super(key: key);
statusReq? status;
Widget widget;
  @override
  Widget build(BuildContext context) {
    return (status==statusReq.loading)? Lottie.asset("assets/Lottie/Loading.json") :
    (status==statusReq.success)? Lottie.asset("assets/Lottie/success.json"):
    (status==statusReq.Empty)? Lottie.asset("assets/Lottie/Empty.json"):
    (status==statusReq.Error)? Lottie.asset("assets/Lottie/Error.json"):
        widget;
  }
}

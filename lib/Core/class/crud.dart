import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:restaurantapp/core/class/satusReq.dart';
import 'package:restaurantapp/core/functions/checkConnectInternet.dart';

class crud {
  Future<Either<statusReq, Map>> postData(String url, Map data) async {
    try {
      if (await checkInterne() == true) {
        print("check  ${url}");
        var res = await http.post(Uri.parse(url), body: data);
        print("check11");
        print("data is  ${data}");
        print(res.statusCode);
        if (res.statusCode == 200 || res.statusCode == 201) {
          Map resBody = jsonDecode(res.body);
          print("************************");
          print(resBody);
          return Right(resBody);
        } else {
          return Left(statusReq.Error);
        }
      } else {
        return Left(statusReq.Error);
      }
    }
    catch (e) {
        // Handle other types of exceptions
        print("Unknown error occurred: $e");
        return Left(statusReq.Error);
    }
  }
}

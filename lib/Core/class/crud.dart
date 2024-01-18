import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:restaurantapp/core/class/satusReq.dart';
import 'package:restaurantapp/core/functions/checkConnectInternet.dart';
class crud {
  Future<Either<statusReq, Map>> postData(String url, Map data,{Map<String, dynamic>? queryParams, String? pathParam}) async {
    try {
      if (await checkInterne() == true) {
        print("Post");
        print("check  ${url}");
        if (queryParams != null && queryParams.isNotEmpty) {
          final query = Uri(queryParameters: queryParams).query;
          url = '$url?$query';  // Append the query parameters to the URL
        }

        if (pathParam != null && pathParam.isNotEmpty) {
          url = '$url/$pathParam';  // Append the path parameter to the URL
        }

        print("check $url");
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
    } catch (e) {
      // Handle other types of exceptions
      print("Unknown error occurred: $e");
      return Left(statusReq.Error);
    }
  }

  Future<Either<statusReq, Map>> getData(String url, {Map<String, dynamic>? queryParams, String? pathParam}) async {
    try {
      if (await checkInterne() == true) {
        print("Get");

        if (queryParams != null && queryParams.isNotEmpty) {
          final query = Uri(queryParameters: queryParams).query;
          url = '$url?$query';  // Append the query parameters to the URL
        }

        if (pathParam != null && pathParam.isNotEmpty) {
          url = '$url/$pathParam';  // Append the path parameter to the URL
        }

        print("check $url");

        var res = await http.get(Uri.parse(url));
        print("check11");
        print("data is $res");
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
    } catch (e) {
      // Handle other types of exceptions
      print("Unknown error occurred: $e");
      return Left(statusReq.Error);
    }
  }
  // Future<Either<statusReq, Map>> getDataAsQuery(String url, {Map<String, dynamic>? queryParams}) async {
  //   try {
  //     if (await checkInterne() == true) {
  //       print("Get ${queryParams?.values}");
  //
  //       if (queryParams != null && queryParams.isNotEmpty) {
  //         final query = Uri(queryParameters: queryParams).query;
  //         print("query ${query}");
  //
  //         // Append the query parameters directly to the URL
  //         url = '$url?$query';  // Append the query parameters to the URL
  //
  //       }
  //
  //       print("check  $url");
  //
  //       var res = await http.get(Uri.parse(url));
  //       print("check11");
  //       print("data is  $res");
  //       print(res.statusCode);
  //       if (res.statusCode == 200 || res.statusCode == 201) {
  //         Map resBody = jsonDecode(res.body);
  //         print("************************");
  //         print(resBody);
  //         return Right(resBody);
  //       } else {
  //         return Left(statusReq.Error);
  //       }
  //     } else {
  //       return Left(statusReq.Error);
  //     }
  //   } catch (e) {
  //     // Handle other types of exceptions
  //     print("Unknown error occurred: $e");
  //     return Left(statusReq.Error);
  //   }
  // }
}
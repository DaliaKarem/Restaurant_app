import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path/path.dart';
import 'package:restaurantapp/models/User.dart';


String _basicAuth = 'Basic ' +
    base64Encode(utf8.encode(
        'DODO:DODO12'));

Map<String, String> myheaders = {
  'authorization': _basicAuth
};

class DataBaseFun{

  getReq(String url) async{
    try{
      var res=await http.get(Uri.parse(url));
      if(res.statusCode==200)
        {
          var resbody=jsonDecode(res.body);
              return resbody;
        }
      else{
        print("Error catch ${res.statusCode}");
      }
    }
    catch(e)
    {
      print("Error catch $e");
    }
  }
  postReq(String url,Map data) async{
    try{
      var res=await http.post(Uri.parse(url),body: data);
      if(res.statusCode==200)
      {
        var resbody=jsonDecode(res.body);

        print("${resbody}");
        return resbody;
      }
      else{
        print("Error catch ${res.statusCode}");
      }
    }
    catch(e)
    {
      print("Error catch $e");
    }
  }
  postReqUser(String url,Map data,File file) async{
    var req = http.MultipartRequest("POST", Uri.parse(url));
    //herewe will treat ith file eed 3para (name of req, bystrea length ad stream, and filename
   var len=file.length();
   var stream=http.ByteStream(file.openRead());
    var mult = http.MultipartFile(
        "img", stream, await len,
        filename: basename(file.path));
    //uploadfile to req which will go to server and wat to upload data also
    //req.headers.addAll(myheaders);
    req.files.add(mult);

    data.forEach((key, value) {
      req.fields[key]=value;
    });
    var request=await req.send();
    var res=await http.Response.fromStream(request);
    if(request.statusCode==200)
    {
      print("***************************");
      print(res.body);
      print("***************************");
      return jsonDecode(res.body);
    }
    else{
      print("Error");
    }
  }
  postReqorder(String url,Map data,File file) async{
    var req = http.MultipartRequest("POST", Uri.parse(url));
    var mult = http.MultipartFile("order_img	", http.ByteStream(file.openRead()), await file.length(),
        filename: basename(file.path));
    req.headers.addAll(myheaders);
    req.files.add(mult);
    data.forEach((key, value) {
      req.fields[key]=value;
    });
    var request=await req.send();
    var res=await http.Response.fromStream(request);
    if(request.statusCode==200)
    {
      return jsonDecode(res.body);
    }
    else{
      print("Error");
    }
  }
}
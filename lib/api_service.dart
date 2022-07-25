import 'dart:convert';

import 'package:covid_project/api_url.dart';
import 'package:covid_project/controller.dart';
import 'package:covid_project/model/WorldModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class ApiService{
  var controller=Get.put(Controller());
 Future<WorldModel?> getWorldStatus() async{

    var response=await http.get(Uri.parse(ApiUrl.all));
    if(response.statusCode==200){
      var obj=jsonDecode(response.body);
      var model=WorldModel.fromJson(obj);
      return model;
    }
    else{
      return null;
    }
 }
 Future<List<dynamic>?> getCountries() async{
   controller.isLoading=true;
   var response=await http.get(Uri.parse(ApiUrl.countries));
   if(response.statusCode==200){
     var obj=jsonDecode(response.body);
     controller.isLoading=false;
     return obj;

   }
   else{
    throw("Error");
   }
 }
}

import 'dart:convert';

import 'package:api_use/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class ProductController extends ChangeNotifier{
  static const baseUrl='https://fakestoreapi.com/products';
    List<dynamic> productList=[];


  Future<void>getProduct()async{
    final response=await http.get(Uri.parse(baseUrl));
   try{
     if(response.statusCode==200){
       final List<dynamic> data=json.decode(response.body);
       productList=data.map((e) => ProductModel.fromJson(e),).toList();
       notifyListeners();

     }
   }catch(ex){
     print("something went wrong $response");
   }
  }
}
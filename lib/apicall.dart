import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:socialmediapracticeapp/fakestore_product_api/productdetailmodel.dart';
import 'package:socialmediapracticeapp/dummyjson_quotes_api/quetosmodel.dart';

class Apicall extends GetxController {
  List<Quote> wlist = [];
  List<Productsdata> productliat = [];
  Future<List<Productsdata>?> fetchmakeupdetails() async {
    String url = 'https://fakestoreapi.com/products';
    var response = await get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        List productList = jsonDecode(response.body);
        return productList.map((e) => Productsdata.fromJson(e)).toList();
      }
    } catch (er) {
      print(er);
    }
    return null;
  }

  Future fetchquotesdata() async {
    String url = 'https://dummyjson.com/quotes';
    var result = await get(Uri.parse(url));
    try {
      if (result.statusCode == 200) {
        var response = Welcome.fromJson(jsonDecode(result.body));
        wlist = response.quotes;
      }
    } catch (e) {
      return e;
    }
  }

  Future fetchmakeupdata() async {
    String url = 'http://makeup-api.herokuapp.com/api/v1/products.json';
    var result = await get(Uri.parse(url));
    try {
      if (result.statusCode == 200) {
        print(result.body);
      }
    } catch (e) {
      print(e);
    }
  }
}

void hideloading() {
  Get.back();
}

showloading(context) {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

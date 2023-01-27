import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmediapracticeapp/Getconnect%20TutoriaL%20BY%20aBHI/binding.dart';
import 'package:socialmediapracticeapp/Getconnect%20TutoriaL%20BY%20aBHI/views.dart';
import 'package:socialmediapracticeapp/dummyjson_quotes_api/qoutesdata.dart';
import 'package:socialmediapracticeapp/fakestore_product_api/makeupproductsdata.dart';
import 'package:socialmediapracticeapp/imageconverter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: Makeupclassbinding(),
      home: Makeupdata()
      //home: const Makeupproductsdata(),
    );
  }
}

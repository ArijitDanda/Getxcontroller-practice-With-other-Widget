import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmediapracticeapp/EcomProductsDetails/ecombinding.dart';
import 'package:socialmediapracticeapp/EcomProductsDetails/ecomview.dart';
import 'package:socialmediapracticeapp/Getconnect%20TutoriaL%20BY%20aBHI/binding.dart';
import 'package:socialmediapracticeapp/Getconnect%20TutoriaL%20BY%20aBHI/views.dart';
import 'package:socialmediapracticeapp/categorysubcategory/categorybinding.dart';
import 'package:socialmediapracticeapp/categorysubcategory/categorydata.dart';

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
      initialBinding: Ecombinding(),
      home: Ecomdatashow()
      //home: const Makeupproductsdata(),
    );
  }
}

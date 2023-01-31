import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmediapracticeapp/categorysubcategory/categorycntrl.dart';

class Categorydata extends GetView<Categorycntrl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category data'),
      ),
      body: controller.obx((state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < state!['CountryList'].length; i++)
                //Image.network(),
                for (var j = 0; j < state['CountryList'][i]['Statelist'].length;j++)
                  Text(state['CountryList'][i]['Statelist'][j]['State_Name'].toString())
              // Text(
              //   "Products Data----------- ",
              //   style: TextStyle(fontSize: 30),
              // ),
              // for (var j = 0; j < state['Productlist'].length; j++)
              //   Image.network(state['Productlist'][j]['Image'])
            ],
          ),
        );
      }),
    );
  }
}

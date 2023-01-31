import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmediapracticeapp/EcomProductsDetails/ecomcntrl.dart';

TextEditingController data = TextEditingController();

class Ecomdatashow extends GetView<Ecomcntrl> {
  const Ecomdatashow({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onFieldSubmitted: (value) {
            Obx(() {
              return Text('$value');
            });
          },
          controller: data,
          decoration: InputDecoration(hintText: 'Enter Varriant Id: '),
        ),
      ),
      body: data == null
          ? CircularProgressIndicator()
          : controller.obx((state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(state['Productdetails']['Field4Name']),
                    ],
                  )
                ],
              );
            }),
    );
  }
}

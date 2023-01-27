import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmediapracticeapp/Getconnect%20TutoriaL%20BY%20aBHI/cntrl.dart';

class Makeupdata extends GetView<MyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getconnect With Statemixin'),
      ),
      body: controller.obx((state) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.5),
          itemCount: state?.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(state![index]['image_link']),
                Text(
                  state[index]['id'].toString(),
                  softWrap: true,
                ),
                // for (var i = 0; i < state[index]['product_colors'].length; i++)
                //   Text(
                //     state[index]['product_colors'][i]['colour_name'].toString(),
                //     // style: TextStyle(
                //     //     color: getColorFromHex(
                //     //         '${state[index]['product_colors'][i]['hex_value']}')),
                //   ),
                Wrap(
                  children: [
                    for (var i = 0;
                        i < state[index]['product_colors'].length;
                        i++)
                      CircleAvatar(
                        backgroundColor: Color(int.parse(state[index]
                                ['product_colors'][i]['hex_value']
                            .toString()
                            .replaceAll("#", '0xff'))),
                        // backgroundColor: getColorFromHex(
                        //     '${state[index]['product_colors'][i]['hex_value']}'),
                      ),
                  ],
                )
              ],
            );
          },
        );
      }),
    );
  }

  Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }

    return Color(int.parse(hexColor, radix: 16));
  }
}

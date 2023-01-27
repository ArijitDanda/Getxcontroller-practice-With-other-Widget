import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmediapracticeapp/apicall.dart';
import 'package:socialmediapracticeapp/fakestore_product_api/productdetailmodel.dart';

class Fetchproductsdata extends StatefulWidget {
  final List<Productsdata>? plist;
  const Fetchproductsdata({super.key, this.plist});

  @override
  State<Fetchproductsdata> createState() => _FetchproductsdataState();
}

class _FetchproductsdataState extends State<Fetchproductsdata> {
  final Apicall controller = Get.put(Apicall());

  List<Productsdata> productExList = <Productsdata>[];
  _getProductExData() async {
    // isLoading.value = true;
    var result = await controller.fetchmakeupdetails();
    // isLoading.value = false;
    if (result != null) {
      productExList = result;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getProductExData();
    controller.fetchmakeupdata();
    //  getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: productExList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueAccent),
                    child: InkWell(
                      onTap: () {
                        showloading(context);
                      },
                      // child: Image.network(
                      //   productExList[index].image!,
                      //   fit: BoxFit.fill,
                      //   height: 100,
                      //   width: 100,
                      // ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  );
                },
              ),
            ),
            Flexible(
              child: productExList.length == 0
                  ? showloading(context)
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: productExList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 120,
                                    width: 120,
                                    child: Image.network(
                                      productExList[index].image!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            productExList[index].id.toString()),
                                        Text(
                                          productExList[index].title!,
                                          maxLines: 2,
                                          softWrap: true,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        Text(productExList[index]
                                            .price
                                            .toString()),
                                        Text(productExList[index].category!),
                                        Text(
                                          productExList[index].description!,
                                          // maxLines: 2,
                                          softWrap: true,
                                        ),
                                        Text(productExList[index]
                                            .rating!
                                            .rate
                                            .toString()),
                                        Text(productExList[index]
                                            .rating!
                                            .count
                                            .toString()),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
            ),
          ],
        ),
      ),
    );
  }

  // Future getdata() async {
  //   await controller.fetchmakeupdetails();
  //   setState(() {});
  // }
}

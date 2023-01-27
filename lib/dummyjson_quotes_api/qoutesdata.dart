import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmediapracticeapp/apicall.dart';

class Quotesdata extends StatefulWidget {
  const Quotesdata({super.key});
  @override
  State<Quotesdata> createState() => _Quotesdata();
}

class _Quotesdata extends State<Quotesdata> {
  final Apicall Wlistcontrollr = Get.put(Apicall());
  _getdata() async {
    await Wlistcontrollr.fetchquotesdata();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice App'),
      ),
      body: Wlistcontrollr.wlist.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: Wlistcontrollr.wlist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(Wlistcontrollr.wlist[index].id.toString()),
                  title: Text(Wlistcontrollr.wlist[index].author),
                  subtitle: Text(Wlistcontrollr.wlist[index].quote),
                );
              },
            ),
    );
  }
}

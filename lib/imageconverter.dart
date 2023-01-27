import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Imageconverter extends StatefulWidget {
  const Imageconverter({super.key});

  @override
  State<Imageconverter> createState() => _ImageconverterState();
}

class _ImageconverterState extends State<Imageconverter> {
  final ImagePicker _pick = ImagePicker();
  String? imagedata;
  String? base64string;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Base 64 Conveter'),
      ),
      // ignore: prefer_const_constructors
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  imagedata == null
                      ? const CircleAvatar(
                          radius: 120,
                          backgroundColor: Colors.blueGrey,
                        )
                      : ClipOval(
                          child: CircleAvatar(
                            radius: 120,
                            backgroundColor: Colors.blueGrey,
                            child: Image.file(
                              File(imagedata!),
                              height: 240,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  Positioned(
                    bottom: 10,
                    right: 25,
                    child: CircleAvatar(
                        radius: 22,
                        child: IconButton(
                            onPressed: () {
                              getcamera();
                            },
                            icon: Icon(Icons.camera_alt_rounded))),
                  ),
                ],
              ),
              Text("\t${imagedata!}"),
              Text('${base64string}'),
            ],
          ),
        ),
      ),
    );
  }

  void chooseCAmera(ImageSource source) async {
    var image = await _pick.pickImage(source: source);
    if (image != null) {
      imagedata = image.path;
      File imagefile = File(imagedata!); //convert Path to File
      Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
      base64string = base64.encode(imagebytes); //convert bytes to base64 string
      // print(base64string);
    }
    setState(() {});
  }

  getcamera() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        chooseCAmera(ImageSource.camera);
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.camera)),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        chooseCAmera(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.browse_gallery)),
                ],
              ),
              Row(
                children: [Text('Camera'), Spacer(), Text('Gallery')],
              ),
            ],
          ),
        );
      },
    );
  }
}

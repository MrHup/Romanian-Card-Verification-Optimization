import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageFromB64 extends StatelessWidget {
  ImageFromB64(this.b64Img, {super.key});
  String b64Img;

  @override
  Widget build(BuildContext context) {
    if (b64Img == "") return Container();

    Uint8List bytes = const Base64Decoder().convert(b64Img);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.memory(bytes),
      ),
    );
  }
}

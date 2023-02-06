import 'package:flutter/material.dart';
import 'package:frontend/common/static.dart';
import 'package:frontend/theme/text_styles.dart';
import 'dart:convert';

import 'package:frontend/widgets/image_b64.dart';

class AnalyserScreen extends StatelessWidget {
  const AnalyserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(26, 32, 44, 1),
        body: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Image(image: AssetImage('assets/images/logo.png')),
                    ),
                    const Text("Addons and Stuff",
                        style: TextStyles.subtitleDescriptionHighlight),
                    ImageFromB64(GlobalStatic.b64Img)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/theme/text_styles.dart';

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
                    const Text("Analyser Screen",
                        style: TextStyles.subtitleDescriptionHighlight),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

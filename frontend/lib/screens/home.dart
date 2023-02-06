import 'package:flutter/material.dart';
import 'package:frontend/theme/text_styles.dart';
import 'package:frontend/widgets/drop_file_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                ],
              ),
            ),
            DropFileCard(),
          ],
        ),
      ),
    );
  }
}

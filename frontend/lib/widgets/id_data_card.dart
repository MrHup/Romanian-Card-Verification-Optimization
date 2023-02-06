import 'package:flutter/material.dart';
import 'package:frontend/theme/text_styles.dart';

class IDDataCard extends StatelessWidget {
  const IDDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text("ID Information",
              style: TextStyles.subtitleDescription, textAlign: TextAlign.left),
          Text("First Name:",
              style: TextStyles.smallNoteText, textAlign: TextAlign.left),
          Text("Last Name:",
              style: TextStyles.smallNoteText, textAlign: TextAlign.left),
          Text("Address:",
              style: TextStyles.smallNoteText, textAlign: TextAlign.left),
          Text("Birth Date:",
              style: TextStyles.smallNoteText, textAlign: TextAlign.left),
          Text("CNP:",
              style: TextStyles.smallNoteText, textAlign: TextAlign.left),
        ],
      ),
    );
  }
}

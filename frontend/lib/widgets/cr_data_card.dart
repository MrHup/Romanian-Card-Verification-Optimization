import 'package:flutter/material.dart';
import 'package:frontend/common/cr_data.dart';
import 'package:frontend/theme/text_styles.dart';

class CRDataCard extends StatelessWidget {
  CRDataCard(this.data, {super.key});
  final CRData data;
  @override
  Widget build(BuildContext context) {
    const double padding = 4;
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      child: Container(
        color: data.alert_index == 0
            ? Colors.green
            : data.alert_index == 0.5
                ? Colors.yellow
                : Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Criminal record Information",
                style: TextStyles.subtitleDescription,
                textAlign: TextAlign.left),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, padding, 0, padding),
              child: Text("First Name: ${data.found_person_name}",
                  style: TextStyles.smallNoteText, textAlign: TextAlign.left),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, padding, 0, padding),
              child: Text("Birth Date: ${data.found_person_dob}",
                  style: TextStyles.smallNoteText, textAlign: TextAlign.left),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/common/cr_data.dart';
import 'package:frontend/theme/text_styles.dart';

class IDVerifDataCard extends StatelessWidget {
  IDVerifDataCard(this.reason, {super.key});
  final String reason;
  @override
  Widget build(BuildContext context) {
    const double padding = 4;
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      child: Container(
        color: reason == "All good." ? Colors.green : Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("ID Format Verification",
                style: TextStyles.subtitleDescription,
                textAlign: TextAlign.left),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, padding, 0, padding),
              child: Text("Reason: ${reason}",
                  style: TextStyles.smallNoteText, textAlign: TextAlign.left),
            ),
          ],
        ),
      ),
    );
  }
}

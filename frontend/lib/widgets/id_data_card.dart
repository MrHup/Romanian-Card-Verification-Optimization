import 'package:flutter/material.dart';
import 'package:frontend/common/id_data.dart';
import 'package:frontend/theme/text_styles.dart';

class IDDataCard extends StatelessWidget {
  IDDataCard(this.data, {super.key});
  final IDData data;
  @override
  Widget build(BuildContext context) {
    const double padding = 4;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("ID Information",
              style: TextStyles.subtitleDescription, textAlign: TextAlign.left),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, padding, 0, padding),
            child: Text("First Name: ${data.firstName}",
                style: TextStyles.smallNoteText, textAlign: TextAlign.left),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, padding),
            child: Text("Last Name: ${data.lastName}",
                style: TextStyles.smallNoteText, textAlign: TextAlign.left),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, padding),
            child: Text("Address: ${data.address}",
                style: TextStyles.smallNoteText, textAlign: TextAlign.left),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, padding),
            child: Text("Birth Date: ${data.birthDate}",
                style: TextStyles.smallNoteText, textAlign: TextAlign.left),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, padding),
            child: Text("CNP: ${data.cnp}",
                style: TextStyles.smallNoteText, textAlign: TextAlign.left),
          ),
        ],
      ),
    );
  }
}

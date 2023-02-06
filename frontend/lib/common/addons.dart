import 'package:flutter/material.dart';

// starts the process flow
void startProcessFlow(BuildContext context, String base64Image) {
  print("img_pan : $base64Image");

  // navigate to the analyser screen
  Navigator.pushNamedAndRemoveUntil(
    context,
    "/analyser",
    (route) => false,
  );
}

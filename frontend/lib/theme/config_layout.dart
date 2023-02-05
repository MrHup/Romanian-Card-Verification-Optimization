import 'package:flutter/material.dart';

bool isDevicePortrait(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.portrait;
}

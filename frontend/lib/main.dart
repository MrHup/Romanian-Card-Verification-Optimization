import 'package:flutter/material.dart';
import 'package:frontend/screens/analyser.dart';
import 'package:frontend/screens/home.dart';
import 'package:frontend/widgets/drop_file_card.dart';
import 'package:frontend/widgets/drop_file_zone.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => const HomeScreen());
          }
          if (settings.name == '/analyser') {
            return PageRouteBuilder(
                pageBuilder: (_, __, ___) => const AnalyserScreen());
          }
          return null;
        },
      );
}

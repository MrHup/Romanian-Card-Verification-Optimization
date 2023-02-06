import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/common/id_data.dart';
import 'package:frontend/common/static.dart';

// starts the process flow
void startProcessFlow(BuildContext context, String base64Image) {
  // print("img_pan : $base64Image");
  GlobalStatic.b64Img = base64Image;

  // navigate to the analyser screen
  Navigator.pushNamed(context, "/analyser");

  // getIdDetails();
}

Future<IDData> getIdDetails() async {
  String url = "http://localhost:80/ocr";
  Map<String, String> headers = {"Content-type": "application/json"};
  // make a POST request with following body: photo, session_id and time_spent
  print("Sending request to $url");

  final response = await http.post(Uri.parse(url),
      headers: headers,
      body: jsonEncode({
        "photo": "data:image/png;base64,${GlobalStatic.b64Img}",
        "session_id": "morpheus",
        "time_spent": "0",
      }));

  if (response.statusCode == 200) {
    final list = jsonDecode(response.body);
    final res = IDData.fromJson(list[0]);
    GlobalStatic.idData = res;
    print(res.toString());
    return res;
  } else {
    print('Failed to load data');
    return IDData(
        firstName: "",
        lastName: "",
        address: "",
        birthDate: "",
        cnp: "",
        idType: "");
  }
}

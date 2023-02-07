import 'package:frontend/common/cr_data.dart';
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
  getCRDetails("Mihai Popescu");
  // Navigator.pushNamed(context, "/analyser");
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

void getCRDetails(String name) async {
  String url =
      "https://b3d4-2a02-2f09-3919-9d00-acee-a03d-411b-8a20.eu.ngrok.io/api/search?full-name=${name}&api-key=T2Y433wrg3ad";
  print("Sending request to $url");

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final list = jsonDecode(response.body);
    final res = CRData.fromJson(list[0]);
    GlobalStatic.crData = res;
    print(res.toString());
  } else {
    print('Failed to load data');
  }
}

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
  Navigator.pushNamed(context, "/analyser");
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

Future<CRData> getCRDetails({String name = "Flavius"}) async {
  String url =
      "http://127.0.0.1:5000/api/search?full-name=${name}&api-key=T2Y433wrg3ad";
  print("Sending request to $url");

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final res = CRData.fromJson(jsonDecode(response.body));
      GlobalStatic.crData = res;
      print(res.toString());
      return res;
    } else {
      print('Failed to load data');
      return CRData(
          alert_index: 0,
          found_person_dob: "",
          found_person_name: "",
          full_name: "",
          pic_source: "",
          source: "",
          source_link: "");
    }
  } catch (e) {
    print(e);
    return CRData(
        alert_index: 0,
        found_person_dob: "",
        found_person_name: "",
        full_name: "",
        pic_source: "",
        source: "",
        source_link: "");
  }
}

Future<String> getIDAnalysis({String cnp = ""}) async {
  String url = "http://127.0.0.1:5000/api/validation?cnp=${cnp}";
  print("Sending request to $url");

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      print(res.toString());
      return res["reason"];
    } else {
      print('Failed to load data');
      return "Failed to load data";
    }
  } catch (e) {
    print(e);
    return "Failed to load data";
  }
}

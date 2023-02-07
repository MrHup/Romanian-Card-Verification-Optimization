import 'package:flutter/material.dart';
import 'package:frontend/common/addons.dart';
import 'package:frontend/common/cr_data.dart';
import 'package:frontend/common/id_data.dart';
import 'package:frontend/common/static.dart';
import 'package:frontend/theme/text_styles.dart';
import 'package:frontend/widgets/cr_data_card.dart';
import 'package:frontend/widgets/id_data_card.dart';
import 'package:frontend/widgets/id_verif_data_card.dart';
import 'dart:convert';

import 'package:frontend/widgets/image_b64.dart';

class AnalyserScreen extends StatefulWidget {
  const AnalyserScreen({super.key});

  @override
  State<AnalyserScreen> createState() => _AnalyserScreenState();
}

class _AnalyserScreenState extends State<AnalyserScreen> {
  Future<IDData> _data = getIdDetails();
  Future<CRData> _crData = getCRDetails();
  Future<String> _idreason = getIDAnalysis();
  List<Widget> _addons = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(26, 32, 44, 1),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        body: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Image(image: AssetImage('assets/images/logo.png')),
                    ),
                    const Text("Addons and Stuff",
                        style: TextStyles.subtitleDescriptionHighlight),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ImageFromB64(GlobalStatic.b64Img),
                            Expanded(
                              child: FutureBuilder<IDData>(
                                  future: _data,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<IDData> snapshot) {
                                    if (snapshot.hasData) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          IDDataCard(snapshot.data!),
                                          TextButton(
                                            style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.blue),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                final name =
                                                    "${GlobalStatic.idData.firstName} ${GlobalStatic.idData.lastName}"
                                                        .toUpperCase();
                                                _crData =
                                                    getCRDetails(name: name);
                                                _addons.add(Row(
                                                  children: [
                                                    Expanded(
                                                      child: FutureBuilder<
                                                              CRData>(
                                                          future: _crData,
                                                          builder: (BuildContext
                                                                  context,
                                                              AsyncSnapshot<
                                                                      CRData>
                                                                  snapshot) {
                                                            if (snapshot
                                                                .hasData) {
                                                              return CRDataCard(
                                                                  snapshot
                                                                      .data!);
                                                            } else if (snapshot
                                                                .hasError) {
                                                              return Text(
                                                                  "${snapshot.error}");
                                                            }
                                                            return const CircularProgressIndicator();
                                                          }),
                                                    ),
                                                  ],
                                                ));
                                              });
                                            },
                                            child:
                                                Text('Check Criminal Record'),
                                          ),
                                          TextButton(
                                            style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.blue),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                final name =
                                                    "${GlobalStatic.idData.firstName} ${GlobalStatic.idData.lastName}"
                                                        .toUpperCase();
                                                _idreason = getIDAnalysis(
                                                    cnp: GlobalStatic
                                                        .idData.cnp);
                                                _addons.add(Row(
                                                  children: [
                                                    Expanded(
                                                      child: FutureBuilder<
                                                              String>(
                                                          future: _idreason,
                                                          builder: (BuildContext
                                                                  context,
                                                              AsyncSnapshot<
                                                                      String>
                                                                  snapshot) {
                                                            if (snapshot
                                                                .hasData) {
                                                              return IDVerifDataCard(
                                                                  snapshot
                                                                      .data!);
                                                            } else if (snapshot
                                                                .hasError) {
                                                              return Text(
                                                                  "${snapshot.error}");
                                                            }
                                                            return const CircularProgressIndicator();
                                                          }),
                                                    ),
                                                  ],
                                                ));
                                              });
                                            },
                                            child: Text(
                                                'Check ID format validity'),
                                          )
                                        ],
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text("${snapshot.error}");
                                    }
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ..._addons,
            ],
          ),
        ));
  }
}

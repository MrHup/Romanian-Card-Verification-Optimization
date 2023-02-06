import 'package:frontend/theme/text_styles.dart';
import 'package:frontend/common/addons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class DropFileZone extends StatefulWidget {
  const DropFileZone({super.key});

  @override
  State<DropFileZone> createState() => _DropFileZoneState();
}

class _DropFileZoneState extends State<DropFileZone> {
  late DropzoneViewController controller1;
  final ImagePicker _picker = ImagePicker();
  bool highlighted1 = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildZone1(context),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(56.0),
                  ),
                ),
                onPressed: () async {
                  var res =
                      await _picker.pickImage(source: ImageSource.gallery);
                  final bytes = await res!.readAsBytes();
                  String base64Image =
                      "data:image/png;base64," + base64Encode(bytes);

                  startProcessFlow(base64Image);
                },
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text('Upload Image',
                      style: TextStyles.dropZoneButtonText),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("or drop a file here",
                    style: TextStyles.subsectionBoldText),
              )
            ],
          ),
        ),
        if (highlighted1)
          Container(
            // color: Colors.lightBlue.withOpacity(0.5),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(56.0)),
                color: Colors.lightBlueAccent.withOpacity(0.5)),
            child: const Center(
              child: Text('Drop here', style: TextStyles.overlayTextDropZone),
            ),
          ),
        if (highlighted1)
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Image(
                        image: AssetImage('assets/images/corner_TL.png'),
                        height: 50,
                        width: 50),
                    Image(
                        image: AssetImage('assets/images/corner_TR.png'),
                        height: 50,
                        width: 50),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Image(
                        image: AssetImage('assets/images/corner_BL.png'),
                        height: 50,
                        width: 50),
                    Image(
                        image: AssetImage('assets/images/corner_BR.png'),
                        height: 50,
                        width: 50),
                  ],
                )
              ],
            ),
          ),
      ],
    );
  }

  Widget buildZone1(BuildContext context) => Builder(
        builder: (context) => DropzoneView(
          operation: DragOperation.copy,
          cursor: CursorType.grab,
          onCreated: (ctrl) => controller1 = ctrl,
          onLoaded: () => print('Zone 1 loaded'),
          onError: (ev) => print('Zone 1 error: $ev'),
          onHover: () {
            setState(() => highlighted1 = true);
            print('Zone 1 hovered');
          },
          onLeave: () {
            setState(() => highlighted1 = false);
            print('Zone 1 left');
          },
          onDrop: (ev) async {
            print('Zone 1 drop: ${ev.name}');
            print('Zone 1 drop: ${ev.size}');
            setState(() {
              highlighted1 = false;
            });
            final bytes = await controller1.getFileData(ev);
            String base64Image = "data:image/png;base64," + base64Encode(bytes);

            startProcessFlow(base64Image);
          },
          onDropMultiple: (ev) async {
            print('Zone 1 drop multiple: $ev');
          },
        ),
      );
}

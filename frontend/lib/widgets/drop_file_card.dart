import 'package:frontend/theme/config_layout.dart';
import 'package:frontend/theme/text_styles.dart';
import 'package:frontend/widgets/drop_file_zone.dart';
import 'package:flutter/material.dart';

class DropFileCard extends StatelessWidget {
  const DropFileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            // color: Colors.green,
            height: isDevicePortrait(context)
                ? MediaQuery.of(context).size.height * 0.5
                : MediaQuery.of(context).size.height * 0.5,
            width: isDevicePortrait(context)
                ? MediaQuery.of(context).size.width * 0.8
                : MediaQuery.of(context).size.width * 0.4,
            // height: MediaQuery.of(context).size.width * 0.8,

            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(56.0),
              ),
              elevation: 10,
              child: const DropFileZone(),
            ),
          ),
          // text below the drop zone
          SizedBox(
            width: isDevicePortrait(context)
                ? MediaQuery.of(context).size.width * 0.8
                : MediaQuery.of(context).size.width * 0.4,
            child: const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                'By uploading an image or URL you agree to our Terms of Service. This site is protected by hCaptcha and its Privacy Policy and Terms of Service apply.',
                style: TextStyles.smallNoteText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoadingDialog {
  static Future<void> open(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.2),
      builder: (BuildContext buildContext) {
        return Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              child: SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void close(BuildContext context) {
    Navigator.pop(context);
  }
}

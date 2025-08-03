import 'package:flutter/material.dart';

import '../comm_widget.dart';
import 'colors.dart';
import 'font_sizes.dart';

class CommDialogs{
  static void showProgressDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return false /*true*/;
            },
            child: Theme(
              data: Theme.of(context)
                  .copyWith(dialogBackgroundColor: Colors.transparent),
              child: Dialog(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  color: Colors.transparent,
                  margin: EdgeInsets.all(45),
                  width: 60,
                  height: 50,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(primaryColor)),
                        ),
                      ]),
                ),
              ),
            ),
          );
        });

//    return Container();
  }

  static Future<void> showCustomDialogBox({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? onOkPressed,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 10),
                  Text(message, textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      if (onOkPressed != null) onOkPressed();
                    },
                    child: const Text("OK"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<void> showAlertDialogToNotify(
      {required BuildContext context,
        required bool isNegativeVisible,
        required String title,
        required String msg,
        required Function onOkayPressed}) async {
    Widget yes = CommWidget.buildDialogButton('Okay', ()=>onOkayPressed());

    Widget no = Container();
    if (isNegativeVisible) {
      no = CommWidget.buildDialogButton('No', () async {
        Navigator.of(context).pop();
      });
    }
    CommDialogs.alertDialog(context, yes, no, title, msg);
  }
  static dynamic alertDialog(BuildContext context, Widget okButton,
      Widget cancelButton, String title, String message) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(color: dashboardTileCountColor, fontSize:FontSizes.subHeadingFont,fontWeight: FontWeights.subHeadingWeight),
      ),
      content:
      Text(message, style:  TextStyle(color: dashboardTileCountColor, fontSize: FontSizes.textFont)),
      actions: [
        cancelButton,
        okButton,

      ],
    );

    // show the dialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
              return false /*true*/;
            },
            child: alert);
      },
    );
  }
}
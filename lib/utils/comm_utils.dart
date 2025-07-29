import 'dart:developer' as logDev;
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommUtils {
  static String TAG = 'KayaTag-';
  static int darkTheme = 1;
  static int lightTheme = 2;

  static Future<bool> get isInternetAvailable async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // print('connected');
        return true;
      }
    } on SocketException catch (_) {
      // print('not connected');
      return false;
    }

    return false;
  }
  static void printLog(int lineNum, String msg) {
    logDev.log(msg,
        name:
        "${DateTime.now().hour}-${DateTime.now().minute}-${DateTime.now().second}-$TAG$lineNum");
  }
  static showUpdateAppDialog(BuildContext context) {
    // showDialog()
        // barrierDismissible: false,
        // context: context,
        // builder: (BuildContext context) {
        //   return UpdateAppAlertDialog();
        // });
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geemia_app/utils/values/colors.dart';
import 'comm_utils.dart';

class CommWidget {
  static showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message,style:const TextStyle(color:Colors.white)),
        backgroundColor: color,
        duration: const Duration(seconds: 3)));
  }

  static showToastPrimary(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: pinkColor,
        textColor: Colors.white,
        // textColor: Colors.black,
        fontSize: 14.0);
  }

  static showWhiteToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: pinkColor,
        fontSize: 14.0);
  }

  static showColorToast(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: color,
        // textColor: Colors.white,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  static showCheckoutColorToast(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: color,
        // textColor: Colors.white,
        textColor: Colors.white,
        fontSize: 14.0);
  }
  static InputDecoration getDefaultInputDecoration(
      {required String labelText,
        required EdgeInsetsGeometry contentPadding,
        double labelFontSize = 11.0,
        double borderRadius = 10,
        Color labelColor = primaryColor,
        Color fieldFillColor=Colors.transparent,
        Color borderColor=primaryColor}) {
    double borderWidth=1;
    return InputDecoration(
      // labelText: labelText,
      hintText: labelText,
      // labelStyle: TextStyle(color: primaryColor,fontSize: labelFontSize),
      // labelStyle: TextStyle(color: labelColor,fontSize: labelFontSize),
      hintStyle: TextStyle(color: labelColor,fontSize: labelFontSize),
      contentPadding: contentPadding,
      filled:true,
      fillColor: fieldFillColor,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius),borderSide: BorderSide(color: borderColor,width: borderWidth)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius),borderSide:  BorderSide(color: borderColor,width: borderWidth)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius),borderSide:  BorderSide(color: borderColor,width: borderWidth)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius),borderSide: BorderSide(color: Colors.red,width: borderWidth)),
      disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius),borderSide: BorderSide(color: borderColor,width: borderWidth)),
    );
  }
}

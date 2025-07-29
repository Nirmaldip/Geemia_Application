import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../utils/comm_utils.dart';
import '../utils/comm_widget.dart';
import '../utils/values/colors.dart';
import 'response_format.dart';

class ServerError implements Exception {
  int? _errorCode;
  String _errorMessage = "";

  ServerError.withError({required error,required BuildContext context}) {
    CommUtils.printLog(2310, '${error.runtimeType} - ${error.runtimeType==TypeError}');
    CommUtils.printLog(2311, '${error.stackTrace}');
    if (error.runtimeType == TypeError){
      CommUtils.printLog(2312, '${error.stackTrace}');
      CommUtils.printLog(2313, error.toString());
    }
    if (error.runtimeType == DioException){
      _handleError(error,context);
    }
  }
  static ResponseFormat? getError({required error,required BuildContext context}) {
    CommUtils.printLog(2314, '${error.runtimeType} - ${error.runtimeType==TypeError}');
    CommUtils.printLog(2315, '${error.stackTrace}');
    if (error.runtimeType == TypeError){
      CommUtils.printLog(2316, '${error.stackTrace}');
      CommUtils.printLog(2317, error.toString());
    }
    if (error.runtimeType == DioException){
      CommUtils.printLog(2318, '${error}');
      String res = error.response.toString();
      CommUtils.printLog(2319, '${res}');
      try {
        Map<String,dynamic> j = json.decode(res);
        CommUtils.printLog(23110, '$j');
        ResponseFormat rf = ResponseFormat.fromJson(j);
        CommUtils.printLog(23111, '$rf');
        // var msg = rf.failedReason;
        // _errorMessage = "$msg";
        CommWidget.showColorToast('${rf.reason}', redColor);
        return rf;
      }catch(e){
        // _errorMessage = "Internal server error :$res";
      }
      return null;
    }
    return null;
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioException error, BuildContext context) {
    CommUtils.printLog(23112, '${error.message}');
    CommUtils.printLog(23113, '${error.error}');
    // CommUtils.printLog(2313, '${error.requestOptions.data}');
    CommUtils.printLog(23114, '${error.response}');
    CommUtils.printLog(23115, '${error.stackTrace}');
    CommUtils.printLog(23116, '${error.type}');

    String res = error.response.toString();
        try {
          Map<String,dynamic> j = json.decode(res);
          ResponseFormat rf = ResponseFormat.fromJson(j);
          var msg = rf.reason;
          _errorMessage = "$msg";

          CommWidget.showColorToast(_errorMessage, redColor);
        }catch(e){
          // _errorMessage = "Internal server error :$res";
          _errorMessage = "";
        }
  //
  //       break;
  //
  //     default :{
  //         _errorMessage = "Unknown error : $error";
  //         break;
  //       }
  //   }
    // print(_errorMessage);
    return _errorMessage;
  }

  @override
  String toString() {
    return 'ServerError{_errorCode: $_errorCode, _errorMessage: $_errorMessage}';
  }
}
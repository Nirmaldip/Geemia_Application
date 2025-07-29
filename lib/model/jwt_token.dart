
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../retrofit/api_client.dart';
import '../retrofit/retrofit_client.dart';
import '../retrofit/server_error.dart';
import '../utils/comm_utils.dart';
import '../utils/values/saved_shared_pref.dart';


class JwtToken{
  String access_token;
  String refresh_token;
  JwtToken({required this.access_token, required this.refresh_token});

  factory JwtToken.fromJson(Map<String, dynamic> json) {
    // CommUtils.printLog(1561,'fromJson - $json');
    JwtToken jwtToken = JwtToken(
      access_token: json['access_token'],
      refresh_token: json['refresh_token'],
    );
    // CommUtils.printLog(1561,'jwtToken - $jwtToken');
    return jwtToken;
  }


  Map<String, dynamic> _toJson(JwtToken instance) =>
      <String, dynamic>{
        'access_token': instance.access_token,
        'refreshToken': instance.refresh_token,
      };

  @override
  String toString() {
    return 'JwtToken{access_token: $access_token, refreshToken: $refresh_token}';
  }

  Future<JwtToken?> tokenTestAppRequest(BuildContext context) async {
    bool isInternetAvailable = await CommUtils.isInternetAvailable;
    if (isInternetAvailable) {
      // CommUtils.printLog(4610,'$signInRequest');
      ApiClient apiClient = await RetrofitClient.getAuthApiClient(context);
      apiClient.testTokenAuthentication().then((res) {
        SavedSPref.setStringData(SavedSPref.accessToken, res!.access_token);
        SavedSPref.setStringData(SavedSPref.refreshToken, res.refresh_token);
        SavedSPref.setUserloginData(res.refresh_token);
        CommUtils.printLog(226, '${res.refresh_token}');
        Navigator.pop(context);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) =>  HomeFragment(changeTab, user, Function)));
      }).catchError((e) {
        CommUtils.printLog(4611, "Error $e");
        // final serverError = ServerError.withError(error: e,context: context);
        final responseFormat = ServerError.getError(error: e, context: context);
        CommUtils.printLog(4612, "ServerError $responseFormat");
        // if (responseFormat != null) {
        //   if (responseFormat.failedValue == ErrorConstant.noUserFound) {
        //     showDialog(
        //       context: context,
        //       builder: (context) => AlertMessageDialog(
        //         title: responseFormat.failedReason!,
        //         message: userNotFound,
        //         buttonTitle: 'Register',
        //         assetImage: Icons.cancel_outlined,
        //         onBtnPressed: () {
        //           Navigator.pop(context); //close the dialog
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => Registration(
        //                     email: email,
        //                     changeTab: changeTab,
        //                   )));
        //         },
        //       ),
        //       barrierDismissible: false,
        //     );
        //   } else if (responseFormat.failedValue == ErrorConstant.badCredentials) {
        //     showDialog(
        //       context: context,
        //       builder: (context) => AlertMessageDialog(
        //         title: responseFormat.failedReason!,
        //         message: badCredentials,
        //         buttonTitle: 'Forget Password',
        //         assetImage: Icons.cancel_outlined,
        //         onBtnPressed: () async {
        //           Navigator.pop(context);//close dialog
        //           // await SavedSharedPref.setStringData(
        //           // SavedSharedPref.availableEmail, email);
        //           // Navigator.pop(context, email);
        //           Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword(email: email,changeTab: changeTab,)));
        //         },
        //       ),
        //       barrierDismissible: false,
        //     );
        //   } else if(responseFormat.failedValue == ErrorConstant.accountLocked  || responseFormat.failedValue == ErrorConstant.inActive){
        //     showDialog(
        //       context: context,
        //       builder: (context) => AlertMessageDialog(
        //         title: responseFormat.failedReason!,
        //         message: '',
        //         buttonTitle: 'ok',
        //         assetImage: Icons.cancel_outlined,
        //         onBtnPressed: () async {
        //           Navigator.pop(context);//close dialog
        //           // await SavedSharedPref.setStringData(
        //           // SavedSharedPref.availableEmail, email);
        //           // Navigator.pop(context, email);
        //         },
        //       ),
        //       barrierDismissible: false,
        //     );
        //   }
        // }
        // CommWidget.showWhiteToast(serverError.getErrorMessage());
        return null;
      });

    }
    return null;
  }
}
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../model/jwt_token.dart';
import '../utils/comm_utils.dart';
import '../utils/values/saved_shared_pref.dart';
import 'api_client.dart';

class TokenInterceptor extends Interceptor {

  BuildContext context;
  Function? changeTab;

  TokenInterceptor(this.context,this.changeTab);

  @override
  Future onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    // Here you can put the token, either from preference, sqlite, etc.
    // Here is an example with Preferences
    // final someToken? = prefs.getString('token');
    // // After you choose your token, you assign it to the request.
    String token = await SavedSPref.getStringData(SavedSPref.accessToken);
    try{
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      CommUtils.printLog(322, '$decodedToken');
      // return;
    }catch(e){
      CommUtils.printLog(322, '${e}');
      JwtToken? jToken = await getAccessToken();
      if(jToken!=null) {
        CommUtils.printLog(300, jToken.access_token);
        // options.headers['Authorization'] = 'Bearer ${jToken.access_token}';
        await SavedSPref.setStringData(SavedSPref.accessToken, jToken.access_token);
        await SavedSPref.setStringData(SavedSPref.refreshToken, jToken.refresh_token);
        await SavedSPref.setUserloginData(jToken.access_token);
        options.headers.addAll({'Authorization':'Bearer ${jToken.access_token}'});
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Do something with response data
    super.onResponse(response, handler);
  }

  @override
  Future onError(
      DioError err,
      ErrorInterceptorHandler handler,
      ) async {
    // If the error is 401 Unauthorized, log out the user
    CommUtils.printLog(481, '${err.response?.statusCode}');
    if (err.response?.statusCode == 401) {
      // _repository.logOut();
      // _appDatabase.userDao.deleteAllUsers();
      CommUtils.printLog(455555,'Exception-${(err.response!.statusCode == 401)}');
      await SavedSPref.logoutUserAndNavigateToLogin(context:context,message: 'Session expired. Please login again');
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(changeTab:changeTab??(int i){})), (route) => false);
      // CommWidget.showColorToast('Session expired. Please login again', redColor);
    }
    super.onError(err, handler);
  }

  Future<JwtToken?> getAccessToken() async {
    // Perform a request to the refresh token endpoint and return the new access token.
    Dio dio = Dio();
    JwtToken? jToken;
    String refreshToken = await SavedSPref.getStringData(SavedSPref.refreshToken);
    await dio.get('${apiBaseUrl}authentication/refresh',
        options: Options(headers:
        {
          "Content-Type":"application/json",
          "Accept": "application/json",
          "refreshToken": "Bearer $refreshToken"
        }))
        .then((value) async {

      if (value.statusCode == 200) {
        //get new tokens ...
        // Map<String, dynamic> responseData = value.data as Map<String, dynamic>;
        // print("126 ---- $responseData");

        // Map<String,dynamic> val = json.decode(value.data) as Map<String,dynamic>;
        jToken = JwtToken.fromJson(value.data);

      } else{
        return null;
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      return null;

    });
    return jToken;

  }
}
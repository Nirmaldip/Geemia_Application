import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Screens/Authentication/singup_password.dart';
import '../../model/jwt_token.dart';

class SavedSPref {
  // static const String userId = "userId";
  // static const String email = "email";
  // static const String name = "name";
  static const String accessToken = "access_token";
  static const String refreshToken = "refresh_token";

  static const int isAndroid = 2;
  static const int isIos = 3;

  static const String USER_ID = "USER_ID";
  static const String USER_NAME = "USER_NAME";


  static setIntData(String title, int data) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setInt(title, data);
  }

  static setUserData(JwtToken jwtToken) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(jwtToken.access_token);
    print(decodedToken);

    myPrefs.setString(SavedSPref.accessToken, jwtToken.access_token ?? '');
    myPrefs.setString(SavedSPref.refreshToken, jwtToken.refresh_token ?? '');

    myPrefs.setString(USER_ID, '${decodedToken['userId']}');
    myPrefs.setString(USER_NAME, '${decodedToken['userName']}');
  }



  static setUserloginData(String token) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    // await myPrefs.setInt(SavedSPref.userId,  decodedToken['user']['id']);
    // await myPrefs.setString(SavedSPref.encryptedId, '${decodedToken['user']['encryptedId']}');
    // await myPrefs.setBool(SavedSPref.isUserLoggedIn, true);
  }
  static setStringData(String title, String data) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setString(title, data);
  }

  static setBoolData(String title, bool data) async {
    // CommUtils.printLog(455, data.toString());
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setBool(title, data);
  }

  static Future<int> getIntData(String title) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? intValue = await prefs.getInt(title);
    return intValue??0;
  }

  static Future<String> getStringData(String title) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = await prefs.getString(title);
    return stringValue??'';
  }

  static Future<bool> getBoolData(String title) async {
    // CommUtils.printLog(458812, title);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool boolValue = prefs.getBool(title) ?? false;
    return boolValue;
  }

  static Future<void> logoutUserAndNavigateToLogin(
      {required BuildContext context,required String message,
      bool skipNavigator=false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await  prefs.remove(USER_ID);
    await prefs.remove(USER_NAME);

    // if(message.isNotEmpty)CommWidget.showColorToast(message, redColor);
    // if(!skipNavigator) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
    // }
    // else {
    //   return;
    // }
  }

  static Future<void> logoutUserAndNavigateToHome(BuildContext context) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    // bool selectedDarkTheme = myPrefs.getBool(isDarkThemeSelected)??false;
    // bool language = myPrefs.getBool(hasLanguageChanged)??false;
    myPrefs.clear();
    // myPrefs.setBool(isDarkThemeSelected, selectedDarkTheme);
    // myPrefs.setBool(hasLanguageChanged, language);
    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
  }
}

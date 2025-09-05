import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../model/jwt_token.dart';
import '../utils/comm_utils.dart';
import '../utils/values/saved_shared_pref.dart';
import 'api_client.dart';

class RetrofitClient {
  // static const String apiBaseUrl = "http://127.0.0.1:8000/api/";
  static const String apiBaseUrl = "https://geemia.com/api/";

  /// Basic API client with token refresher
  static Future<ApiClient> getApiClient() async {
    Dio dio = await _dioClientWithTokenRefresher();
    return ApiClient(dio);
  }

  /// Authenticated API client with refresh-token validation
  static Future<ApiClient> getAuthApiClient(BuildContext context) async {
    Dio dio = await _checkAuthTokenValidity(context);
    return ApiClient(dio);
  }

  /// Custom API client fetcher
  static Future<ApiClient> getApiClientWithToken(BuildContext context) async {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: apiBaseUrl,
      receiveTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 15),
    );

    dio.interceptors.clear();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SavedSPref.getStringData(SavedSPref.accessToken);
          options.headers["Authorization"] = "Bearer $token";
          options.headers["token"] = "base64:kBYQtlpPiL0g2HQhqO5prfTBBNRp+uiskhRszVABEHQ=";
          options.headers["accept"] = "*/*";
          options.headers["Content-Type"] = "application/json";
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );

    return ApiClient(dio);
  }

  /// Dio instance with token refresher
  static Future<Dio> _dioClientWithTokenRefresher() async {
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: apiBaseUrl,
      receiveTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 15),
    );

    dio.interceptors.clear();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SavedSPref.getStringData(SavedSPref.accessToken);
          options.headers["Authorization"] = "Bearer $token";
          options.headers["token"] = "base64:kBYQtlpPiL0g2HQhqO5prfTBBNRp+uiskhRszVABEHQ=";
          options.headers["accept"] = "*/*";
          options.headers["Content-Type"] = "application/json";
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );

    return dio;
  }

  /// Dio instance without Authorization header - for login
  static Future<ApiClient> getUnauthenticatedApiClient() async {
    Dio dio = Dio();


    dio.options = BaseOptions(
      baseUrl: apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      contentType: Headers.jsonContentType, // ✅ sets Content-Type: application/json
    );

    dio.interceptors.clear();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["token"] = "base64:kBYQtlpPiL0g2HQhqO5prfTBBNRp+uiskhRszVABEHQ=";
          return handler.next(options);
        },
      ),
    );

    return ApiClient(dio);
  }


  /// Authenticated Dio instance
  static Future<Dio> _dioWithTokenAuthenticator(BuildContext context) async {
    String accessToken =
    await SavedSPref.getStringData(SavedSPref.accessToken);
    Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: apiBaseUrl,
      receiveTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 15),
    );

    dio.interceptors.clear();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Authorization"] = "Bearer $accessToken";
          options.headers["Content-Type"] = "application/json";
          options.headers["token"] = "base64:kBYQtlpPiL0g2HQhqO5prfTBBNRp+uiskhRszVABEHQ=";
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (e, handler) {
          return handler.next(e);
        },
      ),
    );

    return dio;
  }

  /// Checks token validity and refreshes it if expired
  static Future<Dio> _checkAuthTokenValidity(BuildContext context) async {
    Dio dio = Dio();
    String accessToken = await SavedSPref.getStringData(SavedSPref.accessToken);

    if (accessToken.isEmpty) {
      await SavedSPref.logoutUserAndNavigateToLogin(
        context: context,
        message: 'Session expired. Please login again',
      );
    } else {
      bool hasExpired = JwtDecoder.isExpired(accessToken);
// CommUtils.printLog(1651, 'hasExpired=$hasExpired');
      if(hasExpired){
        JwtToken? jToken;
        String refreshToken = await SavedSPref.getStringData(SavedSPref.refreshToken);
        CommUtils.printLog(273, 'REFFRESH - $refreshToken');
        await dio.get('${apiBaseUrl}authentication/refresh',
            options: Options(headers:
            {
              "Content-Type":"application/json",
              "Accept": "application/json",
              "refreshToken": "Bearer $refreshToken"
            }))
            .then((value) async {
          // CommUtils.printLog(274, 'jwtResponse - ${value.data}');
          if (value.statusCode == 200) {
            //get new tokens ...
            jToken = JwtToken.fromJson(value.data);
          } else{
            jToken = null;
          }
        }).onError((error, stackTrace) {
          CommUtils.printLog(275,error.toString());
          jToken = null;

        });
        CommUtils.printLog(1651, 'jToken=$jToken');
        if(jToken==null){
          //Logout user
          await SavedSPref.logoutUserAndNavigateToLogin(context:context,message: 'Session expired. Please login again');
          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(isForcedLogout: true,changeTab: changeTab??(int i){})), (route) => false);
          // CommWidget.showColorToast('Session expired. Please login again', redColor);
        }else {
          await SavedSPref.setStringData(SavedSPref.accessToken, jToken!.access_token);
          await SavedSPref.setStringData(SavedSPref.refreshToken, jToken!.refresh_token);
          await SavedSPref.setUserloginData(jToken!.access_token);
          // CommUtils.printLog(276,'return from expired else');
          return _dioWithTokenAuthenticator(context);
        }
      }else {
        // CommUtils.printLog(278,'return from else');
        return _dioWithTokenAuthenticator(context);
      }
    }

    return dio;
  }

  /// Call this if you want to explicitly refresh user data
  static Future<void> refreshUserData(
      BuildContext context, Function? changeTab) async {
    Dio dio = Dio();
    JwtToken? jToken;
    String refreshToken =
    await SavedSPref.getStringData(SavedSPref.refreshToken);

    try {
      final response = await dio.get(
        '$apiBaseUrl/authentication/refresh',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "refreshToken": "Bearer $refreshToken",
          },
        ),
      );

      if (response.statusCode == 200) {
        jToken = JwtToken.fromJson(response.data);
      }
    } catch (error) {
      CommUtils.printLog(275, error.toString());
      jToken = null;
    }

    if (jToken == null) {
      await SavedSPref.logoutUserAndNavigateToLogin(
        context: context,
        message: 'Session expired. Please login again'
      );
    } else {
      await SavedSPref.setStringData(
          SavedSPref.accessToken, jToken.access_token);
      await SavedSPref.setStringData(
          SavedSPref.refreshToken, jToken.refresh_token);
      await SavedSPref.setUserloginData(jToken.access_token);
    }
  }
}

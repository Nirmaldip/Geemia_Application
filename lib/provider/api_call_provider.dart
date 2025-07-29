import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/jwt_token.dart';
import '../retrofit/api_client.dart';
import '../retrofit/retrofit_client.dart';
import '../retrofit/server_error.dart';
import '../utils/comm_utils.dart';
import '../utils/error_constant.dart';
import '../utils/values/saved_shared_pref.dart';

class ApiCallProvider with ChangeNotifier{

  // Future<bool> authenticateUser(BuildContext context,UserData userData) async {
  //   bool isInternetAvailable = await CommUtils.isInternetAvailable;
  //   if (isInternetAvailable) {
  //     ApiClient apiClient = await RetrofitClient.getApiClient();
  //     JwtToken? jwtToken = await apiClient.login(userData).catchError((e)async {
  //       final responseFormat = ServerError.getError(error: e, context: context);
  //
  //       CommUtils.printLog(46111, "Error $e");
  //       final serverError = ServerError.withError(error: e,context: context);
  //       CommUtils.printLog(46121, "ServerError $serverError");
  //       if(responseFormat?.value == ErrorConstants.ACCOUNT_LOCKED  || responseFormat?.value == ErrorConstants.USER_INACTIVE){
  //         await SavedSPref.logoutUserAndNavigateToLogin(context: context,message: 'User account is not active');
  //       }
  //     });
  //
  //     if(jwtToken!=null) {
  //       await SavedSPref.setUserData(jwtToken);
  //       Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (_) => const DashboardScreen()),
  //             (route) => false,
  //       );
  //       return true;
  //     }
  //     return false;
  //   }
  //   return false;
  // }

  // Future<bool> resetPassword(BuildContext context,String emailId) async {


  // Future<bool> resetPassword(BuildContext context, String emailId) async {
  //   bool isInternetAvailable = await CommUtils.isInternetAvailable;
  //
  //   if (isInternetAvailable) {
  //     ApiClient apiClient = await RetrofitClient.getApiClient();
  //
  //     try {
  //       String? response = await apiClient.forgotPassword(emailId);
  //
  //       CommUtils.printLog(46123, response);
  //
  //       if (response != null) {
  //         final decoded = json.decode(response);
  //         final status = decoded['status'] ?? 'Response';
  //         final reason = decoded['reason'] ?? 'No message provided';
  //
  //         await CommDialogs.showCustomDialogBox(
  //           context: context,
  //           title: status,
  //           message: reason,
  //           onOkPressed: () {
  //             if (status.toString().toLowerCase() == 'success') {
  //               Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(builder: (_) => LoginScreen()),
  //                     (route) => false,
  //               );
  //             }
  //           },
  //         );
  //       }
  //     } catch (e) {
  //       final responseFormat = ServerError.getError(error: e, context: context);
  //       CommUtils.printLog(46111, "Error $e");
  //
  //       final serverError = ServerError.withError(error: e, context: context);
  //       CommUtils.printLog(46121, "ServerError $serverError");
  //
  //       if (responseFormat?.value == ErrorConstants.ACCOUNT_LOCKED ||
  //           responseFormat?.value == ErrorConstants.USER_INACTIVE) {
  //         await SavedSPref.logoutUserAndNavigateToLogin(
  //           context: context,
  //           message: 'User account is not active',
  //         );
  //       } else {
  //         await CommDialogs.showCustomDialogBox(
  //           context: context,
  //           title: "Error",
  //           message: "An unexpected error occurred.",
  //         );
  //       }
  //     }
  //   } else {
  //     await CommDialogs.showCustomDialogBox(
  //       context: context,
  //       title: "No Internet",
  //       message: "Please check your internet connection and try again.",
  //     );
  //   }
  //
  //   return false;
  // }


  // Future<bool> resetPassword(BuildContext context, String emailId) async {
  //   bool isInternetAvailable = await CommUtils.isInternetAvailable;
  //
  //   if (!isInternetAvailable) {
  //     await CommDialogs.showCustomDialogBox(
  //       context: context,
  //       title: "No Internet",
  //       message: "Please check your internet connection and try again.",
  //       onOkPressed: () => Navigator.pop(context), // Just close dialog
  //     );
  //     return false;
  //   }
  //
  //   try {
  //     ApiClient apiClient = await RetrofitClient.getApiClient();
  //
  //     String? response = await apiClient.forgotPassword(emailId);
  //
  //     CommUtils.printLog(46123, response);
  //
  //     if (response != null) {
  //       final decoded = json.decode(response);
  //       final status = decoded['status'] ?? 'Response';
  //       final reason = decoded['reason'] ?? 'No message provided';
  //
  //       // await CommDialogs.showCustomDialogBox(
  //       //   context: context,
  //       //   title: status,
  //       //   message: reason,
  //         // onOkPressed: () {
  //         //   Navigator.of(context, rootNavigator: true).pop(); // dismiss dialog
  //         //
  //         //   if (status.toLowerCase() == 'success') {
  //         //     Navigator.pushAndRemoveUntil(
  //         //       context,
  //         //       MaterialPageRoute(builder: (_) => LoginScreen()),
  //         //           (route) => false,
  //         //     );
  //         //   }
  //         // },
  //           await CommDialogs.showCustomDialogBox(
  //             context: context,
  //             title: status,
  //             message: reason,
  //             onOkPressed: () {
  //               if (status.toLowerCase() == 'success') {
  //                 Future.microtask(() {
  //                   Navigator.pushAndRemoveUntil(
  //                     context,
  //                     MaterialPageRoute(builder: (_) => LoginScreen()),
  //                         (route) => false,
  //                   );
  //                 });
  //               }
  //             },
  //           );
  //       return status.toLowerCase() == 'success';
  //     } else {
  //       await CommDialogs.showCustomDialogBox(
  //         context: context,
  //         title: "Error",
  //         message: "No response from server.",
  //         onOkPressed: () => Navigator.pop(context),
  //       );
  //       return false;
  //     }
  //   } catch (e) {
  //     final responseFormat = ServerError.getError(error: e, context: context);
  //     CommUtils.printLog(46111, "Error $e");
  //
  //     if (responseFormat?.value == ErrorConstants.ACCOUNT_LOCKED ||
  //         responseFormat?.value == ErrorConstants.USER_INACTIVE) {
  //       await SavedSPref.logoutUserAndNavigateToLogin(
  //         context: context,
  //         message: 'User account is not active',
  //       );
  //     } else {
  //       await CommDialogs.showCustomDialogBox(
  //         context: context,
  //         title: "Error",
  //         message: "An unexpected error occurred.",
  //         onOkPressed: () => Navigator.pop(context),
  //       );
  //     }
  //     return false;
  //   }
  // }

  // List<CallLogDTO> _callLogs = [];
  // bool _isLoadingCallLog = false;
  //
  // List<CallLogDTO> get callLogs => _callLogs;
  // bool get isLoading => _isLoadingCallLog;

  // Future<void> fetchCallLogs(BuildContext context, int leadId) async {
  //   _isLoadingCallLog = true;
  //   notifyListeners();
  //
  //   try {
  //     final apiClient = await RetrofitClient.getAuthApiClient(context);
  //     final response = await apiClient.getCallLogs(leadId);
  //     _callLogs = response;
  //   } catch (e) {
  //     _callLogs = [];
  //     CommWidget.showColorToast("Failed to load call logs", Colors.red);
  //   } finally {
  //     _isLoadingCallLog = false;
  //     notifyListeners();
  //   }
  // }


  //disposition
  // List<Disposition> _dispositions = [];
  // bool _isLoadingDisposition = false;
  //
  // List<Disposition> get dispositions => _dispositions;
  // bool get isLoadingDisposition => _isLoadingDisposition;
  //
  // Future<void> fetchDispositions(BuildContext context, int curLeadStatusId) async {
  //   try {
  //     final apiClient = await RetrofitClient.getAuthApiClient(context);
  //     CommUtils.printLog(24, '$curLeadStatusId');
  //     final response = await apiClient.getClinicLeadStatusList(curLeadStatusId);
  //     notifyListeners();
  //     _dispositions = response;
  //   } catch (e) {
  //     CommUtils.printLog(2823, '$e');
  //     CommWidget.showColorToast("Failed to load dispositions", Colors.red);
  //     _dispositions = [];
  //   } finally {
  //     _isLoadingDisposition = false;
  //     notifyListeners();
  //   }
  // }

}
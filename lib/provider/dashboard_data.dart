// minimumSizeimport 'package:flutter/material.dart';
// import 'package:kaya/provider/lead_dashboard_data_dto.dart';
// import 'package:kaya/retrofit/api_client.dart';
// import 'package:kaya/retrofit/retrofit_client.dart';
// import 'package:kaya/retrofit/server_error.dart';
// import 'package:kaya/utils/comm_utils.dart';
// import 'package:kaya/utils/values/saved_shared_pref.dart';
//
// class DashboardProvider with ChangeNotifier {
//   LeadDashboardDataDTO? dashboardData;
//   bool isLoading = false;
//   String? errorMessage;
//
//   Future<void> fetchDashboardData(BuildContext context) async {
//     isLoading = true;
//     errorMessage = null;
//     notifyListeners();
//     bool isInternetAvailable = await CommUtils.isInternetAvailable;
//     if (!isInternetAvailable) {
//       errorMessage = "No internet connection";
//       isLoading = false;
//       notifyListeners();
//       return;
//     }
//     ApiClient apiClient = await RetrofitClient.getAuthApiClient(context);
//       dashboardData = await apiClient.getClinicDashboard().catchError((e) {
//         CommUtils.printLog(1922, "Error $e");
//         return null;
//       });
//     isLoading = false;
//     notifyListeners();
//   }
// }

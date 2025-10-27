import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geemia_app/Screens/dashboard.dart';
import 'package:geemia_app/provider/api_call_provider.dart';
import 'package:geemia_app/provider/ihook_up_provider.dart';
import 'package:geemia_app/provider/job_provider.dart';
import 'package:geemia_app/provider/job_view_model.dart' show JobViewModel;
import 'package:geemia_app/provider/location_provider.dart';
import 'package:geemia_app/retrofit/api_client.dart';
// import 'package:geemia_app/provider/location_provider.dart';
// import 'package:geemia_app/retrofit/place_service.dart';
import 'package:provider/provider.dart';
import 'package:geemia_app/Screens/splashScreen.dart';

void main() {
  final dio = Dio();
    final apiClient = ApiClient(dio);
  runApp(
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => IHookupProvider(apiClient)),
    //     ChangeNotifierProvider(create: (_) => JobProvider(apiClient)),
    //     ChangeNotifierProvider(create: (_) => LocationProvider(),),
    //     ChangeNotifierProvider(create: (_) => AuthProvider()),
    //     ChangeNotifierProvider(create: (_) => JobViewModel(apiClient)),
    //
    //   ],
    //   child: GeemiaApp(),
    // ),
      MultiProvider(
        providers: [
          Provider<ApiClient>(
            create: (_) => ApiClient(Dio()),
          ),
          ChangeNotifierProvider<JobViewModel>(
            create: (context) => JobViewModel(apiClient: context.read<ApiClient>()),
          ),
        ],
        child: GeemiaApp(),
      ),

  );
}

class GeemiaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

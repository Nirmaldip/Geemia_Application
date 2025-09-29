import 'package:geemia_app/model/category.dart';
import 'package:geemia_app/model/job_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/jwt_token.dart';
import '../model/server_response.dart';
import '../model/user_data.dart' show UserData;
import '../model/verify_otp_request.dart';

part 'api_client.g.dart'; // This is required
//Run flutter generate after url change "flutter packages pub run build_runner build"
 const String apiBaseUrl = "https://geemia.com/api/";
// const String apiBaseUrl = "http://127.0.0.1:8000/api/";
// signup/send-code

@RestApi(baseUrl: apiBaseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // Define your endpoints here
  // @GET("/leads")
  // Future<List<Lead>> getLeads();
  @GET("/test/test")
  Future<JwtToken?> testTokenAuthentication();

  @POST("login")
  Future<dynamic> login(@Body() UserData userData);

  @POST("signup/send-code")
  Future<ServerResponse> sendCode(@Body() Map<String, String> body);

  @POST("signup/verify")
  Future<dynamic> verifyOtp(@Body() VerifyOtpRequest request);

  @POST("jobs")
  Future<Job> postJob(@Body() Job job);

  @POST("categories")
  Future<dynamic> createCategory(@Body() Map<String, dynamic> body);

  // @GET("categories")
  // Future<List<dynamic>> getCategories();
  @GET("categories")
  Future<List<dynamic>> getCategories();


// @GET("categories")
  // Future<List<Category>> getCategories();

// @POST("signup/complete")
  // Future<JwtToken?> completeSignup(@Body() VerifyOtpRequest request);
  //


}

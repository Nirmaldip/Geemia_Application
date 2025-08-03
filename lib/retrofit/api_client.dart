import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/jwt_token.dart';
import '../model/verify_otp_request.dart';

part 'api_client.g.dart'; // This is required
//Run flutter generate after url change "flutter packages pub run build_runner build"

const String apiBaseUrl = "http://127.0.0.1:8000/api/";
// signup/send-code

@RestApi(baseUrl: apiBaseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // Define your endpoints here
  // @GET("/leads")
  // Future<List<Lead>> getLeads();
  @GET("/test/test")
  Future<JwtToken?> testTokenAuthentication();

  @POST("signup/send-code")
  Future<JwtToken?> login(@Header("emailId") String emailId);

  @POST("signup/verify")
  Future<JwtToken?> verifyOtp(@Body() VerifyOtpRequest request);


}

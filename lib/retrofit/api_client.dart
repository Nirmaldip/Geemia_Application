import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/jwt_token.dart';

part 'api_client.g.dart'; // This is required
//Run flutter generate after url change "flutter packages pub run build_runner build"

const String apiBaseUrl = "https://uatkayaleadhub.altius.cc/api";

@RestApi(baseUrl: apiBaseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // Define your endpoints here
  // @GET("/leads")
  // Future<List<Lead>> getLeads();
  @GET("/test/test")
  Future<JwtToken?> testTokenAuthentication();

}

import 'package:geemia_app/model/category.dart';
import 'package:geemia_app/model/category_request.dart';
import 'package:geemia_app/model/job_category_response.dart';
import 'package:geemia_app/model/job_detailed_response.dart';
import 'package:geemia_app/model/job_model.dart';
import 'package:geemia_app/provider/job_post_request.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import '../model/jwt_token.dart';
import '../model/server_response.dart';
import '../model/user_data.dart' show UserData;
import '../model/verify_otp_request.dart';

part 'api_client.g.dart';

// API Base URL
const String apiBaseUrl = "https://geemia.com/api/";

@RestApi(baseUrl: apiBaseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // -------------------
  // Auth APIs
  // -------------------

  @POST("login")
  Future<dynamic> login(@Body() UserData userData);

  @POST("signup/send/code")
  Future<ServerResponse> sendCode(@Body() Map<String, String> body);

  @POST("signup/verify")
  Future<dynamic> verifyOtp(@Body() VerifyOtpRequest request);

  // -------------------
  // Jobs APIs
  // -------------------

  // -------------------
// Jobs APIs
// -------------------

  @GET("job-categories")
  Future<JobCategoryResponse> getJobCategories();

  @GET("jobs")
  Future<JobListResponse> getJobs();

  @GET("jobs/{id}")
  Future<JobDetailResponse> getJobDetail(@Path("id") int jobId);

  @POST("job-posts")
  Future<JobPostResponse> createJobPost(@Body() JobPostRequest jobPostRequest);

  @POST("post-categories")
  Future<CategoryCreateResponse> createPostCategory(@Body() CategoryRequest categoryRequest);

  @POST("posts")
  Future<PostCreateResponse> createPost(@Body() PostRequest postRequest);


// -------------------
// iHookups APIs
// -------------------

//   @GET("ihookups/get/profiles-list")
//   Future<List<dynamic>> getProfiles();
//
//   @POST("ihookups/profile/like")
//   Future<dynamic> likeProfile(@Body() Map<String, dynamic> body);
//
//   @DELETE("ihookups/profile/unlike")
//   Future<dynamic> unlikeProfile(@Body() Map<String, dynamic> body);
//
//   @POST("ihookups/send/messages")
//   Future<dynamic> sendMessage(@Body() Map<String, dynamic> body);
//
//   @GET("ihookups/received/messages")
//   Future<List<dynamic>> getMessages();
//
//   // -------------------
//   // Call APIs
//   // -------------------
//
//   @POST("call/initiate/{id}")
//   Future<dynamic> initiateCall(
//       @Path("id") int userId,
//       @Body() Map<String, dynamic> body,
//       );
//
//   @PUT("call/status/id")
//   Future<dynamic> updateCallStatus(
//       @Path("id") int callId,
//       @Body() Map<String, dynamic> body,
//       );
// }
}
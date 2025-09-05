// import 'jwt_token.dart';
//
// class OtpResponse {
//   final bool success;
//   final String message;
//   final JwtToken? data;
//
//   OtpResponse({
//     required this.success,
//     required this.message,
//     this.data,
//   });
//
//   factory OtpResponse.fromJson(Map<String, dynamic> json) {
//     return OtpResponse(
//       success: json['success'] ?? false,
//       message: json['message'] ?? '',
//       data: json['data'] != null ? JwtToken.fromJson(json['data']) : null,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       "success": success,
//       "message": message,
//       "data": data?.toJson(),
//     };
//   }
// }

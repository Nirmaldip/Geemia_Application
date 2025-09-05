class ServerResponse {
  final String? message;
  final Map<String, dynamic>? errors;

  ServerResponse({this.message, this.errors});

  factory ServerResponse.fromJson(Map<String, dynamic> json) {
    return ServerResponse(
      message: json['message'],
      errors: json['errors'],
    );
  }

  bool get isSuccess => message != null && errors == null;
}

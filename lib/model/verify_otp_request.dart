class VerifyOtpRequest {
  final String name;
  final String email;
  final String enterCode;
  final String username;
  final String password;
  final String location;

  VerifyOtpRequest({
    required this.name,
    required this.email,
    required this.enterCode,
    required this.username,
    required this.password,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "enter_code": enterCode,
      "username": username,
      "password": password,
      "location": location,
    };
  }
}

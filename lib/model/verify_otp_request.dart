class VerifyOtpRequest {
  final String name;
  final String email;
  final String enterCode;
  final String username;
  final String password;
  final String location;
  final String role;

  VerifyOtpRequest({
    required this.name,
    required this.email,
    required this.enterCode,
    required this.username,
    required this.password,
    required this.location,
    required this.role
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "enter_code": enterCode,
      "username": username,
      "password": password,
      "location": location,
      "role" : role
    };
  }

  @override
  String toString() {
    return 'VerifyOtpRequest{name: $name, email: $email, enterCode: $enterCode, username: $username, password: $password, location: $location}';
  }
}

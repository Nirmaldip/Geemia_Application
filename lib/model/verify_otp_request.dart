class VerifyOtpRequest {
  final String firstname;
  final String lastname;
  final String email;
  final String username;
  final String password;
  final String role;
  final String enterCode;

  VerifyOtpRequest({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.username,
    required this.password,
    required this.role,
    required this.enterCode,
  });

  /// 🔹 Convert Dart object → JSON
  Map<String, dynamic> toJson() {
    return {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "username": username,
      "password": password,
      "role": role,
      "enter_code": enterCode, // 👈 API expects this key
    };
  }

  /// 🔹 Create Dart object ← JSON
  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) {
    return VerifyOtpRequest(
      firstname: json["firstname"] ?? "",
      lastname: json["lastname"] ?? "",
      email: json["email"] ?? "",
      username: json["username"] ?? "",
      password: json["password"] ?? "",
      role: json["role"] ?? "",
      enterCode: json["enter_code"] ?? "",
    );
  }

  /// 🔹 Easy debugging
  @override
  String toString() {
    return "VerifyOtpRequest(firstname: $firstname, lastname: $lastname, email: $email, "
        "username: $username, password: $password, role: $role, enterCode: $enterCode)";
  }
}

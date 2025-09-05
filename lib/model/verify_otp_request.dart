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
    required this.role,
  });

  /// Factory to safely create request with defaults if values are empty
  factory VerifyOtpRequest.withDefaults({
    String? name,
    required String email,
    required String enterCode,
    String? username,
    required String password,
    String? location,
    String? role,
  }) {
    return VerifyOtpRequest(
      name: (name == null || name.isEmpty) ? "NA" : name,
      email: email,
      enterCode: enterCode,
      username: (username == null || username.isEmpty)
          ? "user_${DateTime.now().millisecondsSinceEpoch}"
          : username,
      password: password,
      location: (location == null || location.isEmpty) ? "NA" : location,
      role: (role == null || role.isEmpty) ? "user" : role,
    );
  }

  /// Convert to JSON for API
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "enter_code": enterCode, // ✅ matches backend
      "username": username,
      "password": password,
      "password_confirmation": password, // ✅ backend expects this
      "location": location,
      "role": role,
    };
  }

  /// Parse from JSON (if needed)
  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) {
    return VerifyOtpRequest(
      name: json["name"] ?? "NA",
      email: json["email"] ?? "",
      enterCode: json["enter_code"] ?? "",
      username: json["username"] ?? "",
      password: json["password"] ?? "",
      location: json["location"] ?? "NA",
      role: json["role"] ?? "user",
    );
  }

  @override
  String toString() {
    return "VerifyOtpRequest{name: $name, email: $email, enterCode: $enterCode, username: $username, password: $password, location: $location, role: $role}";
  }
}

import 'dart:convert';

class RegisterRequest {
  RegisterRequest({
    required this.email,
    required this.password,
    required this.username,
    required this.phone,
    required this.firstName,
    required this.lastName,
  });

  String email;
  String password;
  String firstName;
  String lastName;
  String phone;
  String username;

  factory RegisterRequest.fromRawJson(String str) =>
      RegisterRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
          email: json["email"],
          password: json["password"],
          phone: json["phone"],
          firstName: json["first_name"],
          lastName: json["last_name"],
          username: json["username"]);

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
      };
}

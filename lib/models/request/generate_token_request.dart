import 'dart:convert';

class GenerateTokenRequest {
  GenerateTokenRequest({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory GenerateTokenRequest.fromRawJson(String str) =>
      GenerateTokenRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerateTokenRequest.fromJson(Map<String, dynamic> json) =>
      GenerateTokenRequest(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

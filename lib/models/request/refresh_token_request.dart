import 'dart:convert';

class RefershTokenRequest {
  RefershTokenRequest({
    required this.token,
  });

  String? token;

  factory RefershTokenRequest.fromRawJson(String str) =>
      RefershTokenRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RefershTokenRequest.fromJson(Map<String, dynamic> json) =>
      RefershTokenRequest(
        token: json["token"] == null ? '' : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

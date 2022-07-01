import 'dart:convert';

class SendVerificationCodeRequest {
  SendVerificationCodeRequest({
    required this.username,
    required this.checkCode,
  });

  String username;
  String checkCode;

  factory SendVerificationCodeRequest.fromRawJson(String str) =>
      SendVerificationCodeRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SendVerificationCodeRequest.fromJson(Map<String, dynamic> json) =>
      SendVerificationCodeRequest(
        username: json["username"],
        checkCode: json["check_code"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "check_code": checkCode,
      };
}

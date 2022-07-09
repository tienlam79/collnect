import 'dart:convert';

class VerificationCodeResponse {
  VerificationCodeResponse({
    required this.checkCode,
    required this.expiredAt,
  });

  String checkCode;
  String expiredAt;

  factory VerificationCodeResponse.fromRawJson(String str) =>
      VerificationCodeResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerificationCodeResponse.fromJson(Map<String, dynamic> json) =>
      VerificationCodeResponse(
        checkCode: json["check_code"],
        expiredAt: json["expired_at"],
      );

  Map<String, dynamic> toJson() => {
        "checkCode": checkCode,
        "expiredAt": expiredAt,
      };
}

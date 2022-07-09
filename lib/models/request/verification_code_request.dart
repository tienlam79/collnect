import 'dart:convert';

class VerificationCodeRequest {
  VerificationCodeRequest({
    required this.phone,
  });

  String phone;

  factory VerificationCodeRequest.fromRawJson(String str) =>
      VerificationCodeRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerificationCodeRequest.fromJson(Map<String, dynamic> json) =>
      VerificationCodeRequest(
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
      };
}

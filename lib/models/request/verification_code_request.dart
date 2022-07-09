import 'dart:convert';

class VerificationCodeRequest {
  VerificationCodeRequest({
    required this.phone,
    required this.firstName,
    required this.lastName,
  });

  String phone;
  String firstName;
  String lastName;

  factory VerificationCodeRequest.fromRawJson(String str) =>
      VerificationCodeRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerificationCodeRequest.fromJson(Map<String, dynamic> json) =>
      VerificationCodeRequest(
        phone: json["phone"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "first_name": firstName,
        "last_name": lastName,
      };
}

class LoginResponse {
  LoginResponse({
    required this.expiredAt,
    required this.checkCode,
  });

  DateTime expiredAt;
  String checkCode;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        expiredAt: DateTime.parse(json["expired_at"]),
        checkCode: json["check_code"],
      );

  Map<String, dynamic> toJson() => {
        "expired_at": expiredAt.toIso8601String(),
        "check_code": checkCode,
      };
}

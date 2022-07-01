class GenerateTokenResponse {
  GenerateTokenResponse({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.refreshToken,
    required this.scope,
  });

  String accessToken;
  String tokenType;
  int expiresIn;
  String refreshToken;
  String scope;

  factory GenerateTokenResponse.fromJson(Map<String, dynamic> json) =>
      GenerateTokenResponse(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        refreshToken: json["refresh_token"],
        scope: json["scope"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
        "scope": scope,
      };
}

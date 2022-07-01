class RegisterResponse {
  RegisterResponse({
    required this.email,
    required this.password,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  String email;
  String password;
  String username;
  String firstName;
  String lastName;
  String phone;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        email: json["email"],
        password: json["password"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
      };
}

class Profile {
  Profile({
    this.username,
    this.email,
    this.firstName,
    this.lastName,
  });

  String? username;
  String? email;
  String? firstName;
  String? lastName;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
      };
}

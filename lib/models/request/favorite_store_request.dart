import 'dart:convert';

class FavoriteStoreRequest {
  FavoriteStoreRequest({
    required this.like,
    required this.user,
    this.rating,
    this.comment,
  });

  bool like;
  double? rating;
  String? comment;
  int user;

  factory FavoriteStoreRequest.fromRawJson(String str) =>
      FavoriteStoreRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FavoriteStoreRequest.fromJson(Map<String, dynamic> json) =>
      FavoriteStoreRequest(
        like: json["like"],
        user: json["user"],
        rating: json["rating"] == null ? null : json['rating'],
        comment: json["comment"] == null ? null : json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "like": like,
        "user": user,
        "rating": rating,
        "comment": comment,
      };
}

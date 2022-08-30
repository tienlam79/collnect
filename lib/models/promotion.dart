import 'dart:convert';

class Promotion {
  Promotion({
    required this.image,
    required this.route,
  });

  String route;
  String image;
  factory Promotion.fromRawJson(String str) =>
      Promotion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        image: json["image"],
        route: json["route"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "route": route,
      };
}

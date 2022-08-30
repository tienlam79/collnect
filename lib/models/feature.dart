import 'dart:convert';

class Feature {
  Feature({
    required this.title,
    required this.desc,
    required this.image,
    required this.route,
    this.commingSoon,
  });

  String title;
  String desc;
  String route;
  String image;
  bool? commingSoon;
  factory Feature.fromRawJson(String str) => Feature.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        title: json["title"],
        desc: json["desc"],
        image: json["image"],
        route: json["route"],
        commingSoon: json["comming_soon"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "desc": desc,
        "image": image,
        "route": route,
        "comming_soon": commingSoon,
      };
}

import 'dart:convert';

class Feature {
  Feature({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.route,
  });

  String icon;
  String title;
  String subTitle;
  String route;

  factory Feature.fromRawJson(String str) => Feature.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        icon: json["icon"],
        title: json["title"],
        subTitle: json["sub_title"],
        route: json["route"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "title": title,
        "sub_title": subTitle,
        "route": route,
      };
}

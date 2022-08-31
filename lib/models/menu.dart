class Menu {
  Menu({
    required this.title,
    this.route,
    required this.icon,
    this.options,
  });

  String title;
  String? route;
  String icon;
  List<Option>? options;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        title: json["title"],
        route: json["route"],
        icon: json["icon"],
        options: json["options"] == null
            ? null
            : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "route": route,
        "icon": icon,
        "options": options == null
            ? null
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class Option {
  Option({
    required this.title,
    required this.route,
  });

  String title;
  String route;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        title: json["title"],
        route: json["route"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "route": route,
      };
}

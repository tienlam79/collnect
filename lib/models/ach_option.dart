class AchOption {
  AchOption({
    required this.name,
    this.description,
    required this.minAmount,
    required this.maxAmount,
    required this.fee,
    required this.type,
    required this.order,
  });

  String name;
  String? description;
  double minAmount;
  double maxAmount;
  double fee;
  String type;
  int order;

  factory AchOption.fromJson(Map<String, dynamic> json) => AchOption(
        name: json["name"],
        description: json["description"] == null ? null : json["description"],
        minAmount: json["min_amount"],
        maxAmount: json["max_amount"],
        fee: json["fee"],
        type: json["type"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "min_amount": minAmount,
        "max_amount": maxAmount,
        "fee": fee,
        "type": type,
        "order": order,
      };
}

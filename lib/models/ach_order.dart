class AchOrder {
  AchOrder({
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.cid,
    required this.amount,
    required this.fee,
    required this.type,
    required this.status,
  });

  int id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String cid;
  double amount;
  double fee;
  String type;
  String status;

  factory AchOrder.fromJson(Map<String, dynamic> json) => AchOrder(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        cid: json["cid"],
        amount: double.parse(json["amount"]),
        fee: double.parse(json["fee"]),
        type: json["type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "cid": cid,
        "amount": amount,
        "fee": fee,
        "type": type,
        "status": status,
      };
}

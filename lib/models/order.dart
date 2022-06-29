import 'dart:convert';

class Order {
  Order({
    required this.id,
    required this.topupPhone,
    required this.topupName,
    required this.amount,
    required this.cardNumber,
    required this.prefixCardNumber,
    this.fee,
  });

  int id;
  String topupPhone;
  String topupName;
  double amount;
  double? fee;
  String cardNumber;
  String prefixCardNumber;

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        topupPhone: json["topup_phone"],
        topupName: json["topup_name"],
        amount: json["amount"],
        fee: json["fee"] == null ? null : json["fee"],
        cardNumber: json["card_number"],
        prefixCardNumber: json["prefix_card_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "topup_phone": topupPhone,
        "topup_name": topupName,
        "amount": amount,
        "fee": fee,
        "card_number": cardNumber,
        "prefix_card_number": prefixCardNumber,
      };
}

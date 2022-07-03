import 'dart:convert';

class CreateOrderRequest {
  CreateOrderRequest({
    required this.cid,
    required this.productPin,
    required this.amount,
    required this.product,
    this.customerPhone,
    this.customerName,
  });

  String cid;
  String productPin;
  int product;
  String amount;
  String? customerPhone;
  String? customerName;

  factory CreateOrderRequest.fromRawJson(String str) =>
      CreateOrderRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      CreateOrderRequest(
        cid: json["c_id"],
        productPin: json["product_pin"],
        product: json["product"],
        amount: json["amount"],
        customerName: json["customer_name"],
        customerPhone: json["customer_phone"],
      );

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "product_pin": productPin,
        "product": product,
        "amount": amount,
        "customer_name": customerName,
        "customer_phone": customerPhone,
      };
}

import 'package:omny_locator/models/enum_values/order_status.dart';

import 'enum_values/card_type.dart';

class Order {
  Order({
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.cid,
    this.customerPhone,
    this.customerName,
    required this.productPin,
    required this.amount,
    required this.baseAmount,
    required this.fee,
    this.status,
    required this.transactionId,
    required this.product,
  });

  int id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String cid;
  String? customerPhone;
  String? customerName;
  String productPin;
  double amount;
  double baseAmount;
  double fee;
  OrderStatus? status;
  int transactionId;
  OrderProduct product;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        cid: json["cid"],
        customerPhone:
            json["customer_phone"] == null ? null : json["customer_phone"],
        customerName:
            json["customer_name"] == null ? null : json["customer_name"],
        productPin: json["product_pin"],
        amount: double.parse(json["amount"]),
        baseAmount: double.parse(json["base_amount"]),
        fee: double.parse(json["fee"]),
        status: json["status"] == null
            ? null
            : orderStatusValues.map[json["status"]],
        transactionId: json["transaction_id"],
        product: OrderProduct.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "cid": cid,
        "customer_phone": customerPhone,
        "customer_name": customerName,
        "product_pin": productPin,
        "amount": amount,
        "base_amount": baseAmount,
        "fee": fee,
        "status": status == null ? null : orderStatusValues.reverse![status],
        "transaction_id": transactionId,
        "product": product.toJson(),
      };
}

class OrderProduct {
  OrderProduct({
    required this.name,
    this.productFilter,
  });

  String name;
  CardType? productFilter;

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        name: json["name"],
        productFilter: json["product_filter"] == null
            ? null
            : cardTypeValues.map[json["product_filter"]],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "product_filter": productFilter == null
            ? null
            : cardTypeValues.reverse![productFilter],
      };
}

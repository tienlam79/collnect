import 'enum_values/card_type.dart';

class Order {
  Order({
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.cid,
    required this.customerPhone,
    required this.customerName,
    required this.productPin,
    required this.productPrefix,
    required this.amount,
    required this.baseAmount,
    required this.fee,
    required this.status,
    this.transactionId,
    required this.product,
    this.retailerId,
  });

  int id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String cid;
  String customerPhone;
  String customerName;
  String productPin;
  String productPrefix;
  double amount;
  double baseAmount;
  double fee;
  String status;
  int? transactionId;
  OrderProduct product;
  int? retailerId;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        cid: json["cid"],
        customerPhone: json["customer_phone"],
        customerName: json["customer_name"],
        productPin: json["product_pin"],
        productPrefix: json["product_prefix"],
        amount: double.parse(json["amount"]),
        baseAmount: double.parse(json["base_amount"]),
        fee: double.parse(json["fee"]),
        status: json["status"],
        transactionId:
            json["transaction_id"] == null ? null : json["transaction_id"],
        product: OrderProduct.fromJson(json["product"]),
        retailerId: json["retailer_id"] == null ? null : json["retailer_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "cid": cid,
        "customer_phone": customerPhone,
        "customer_name": customerName,
        "product_pin": productPin,
        "product_prefix": productPrefix,
        "amount": amount,
        "base_amount": baseAmount,
        "fee": fee,
        "status": status,
        "transaction_id": transactionId,
        "product": product.toJson(),
        "retailer_id": retailerId,
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

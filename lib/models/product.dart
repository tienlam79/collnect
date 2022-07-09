import 'package:omny_locator/models/enum_values/price_type.dart';

class Product {
  Product({
    required this.id,
    required this.priceList,
    required this.suggestPriceList,
    required this.feeList,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.name,
    required this.prefix,
    required this.sku,
    required this.productFilter,
    this.description,
    this.instruction,
    this.termCondition,
    required this.minPrice,
    required this.maxPrice,
    required this.priceType,
    this.prices,
    this.suggestPrices,
    this.fee,
  });

  int id;
  List<double> priceList;
  List<double> suggestPriceList;
  List<double> feeList;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  String name;
  String prefix;
  String sku;
  String productFilter;
  String? description;
  String? instruction;
  String? termCondition;
  double minPrice;
  double maxPrice;
  PriceType? priceType;
  String? prices;
  String? suggestPrices;
  String? fee;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        priceList: List<double>.from(json['fee_list'].map((x) => x.toDouble())),
        suggestPriceList: List<double>.from(
            json["suggest_price_list"].map((x) => x.toDouble())),
        feeList: List<double>.from(json["fee_list"].map((x) => x.toDouble())),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
        name: json["name"],
        prefix: json["prefix"],
        sku: json["sku"],
        productFilter: json["product_filter"],
        description: json["description"] == null ? null : json["description"],
        instruction: json["instruction"] == null ? null : json["instruction"],
        termCondition:
            json["term_condition"] == null ? null : json["term_condition"],
        minPrice: double.parse(json["min_price"]),
        maxPrice: double.parse(json["max_price"]),
        priceType: json["price_type"] == null
            ? null
            : priceTypeValues.map[json["price_type"]],
        prices: json["prices"] == null ? null : json["prices"],
        suggestPrices:
            json["suggest_prices"] == null ? null : json["suggest_prices"],
        fee: json["fee"] == null ? null : json["fee"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price_list": List<double>.from(priceList.map((x) => x)),
        "suggest_price_list": List<double>.from(suggestPriceList.map((x) => x)),
        "fee_list": List<double>.from(feeList.map((x) => x)),
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": createdAt == null ? null : updatedAt?.toIso8601String(),
        "deleted_at": deletedAt == null ? null : deletedAt?.toIso8601String(),
        "name": name,
        "prefix": prefix,
        "sku": sku,
        "product_filter": productFilter,
        "description": description,
        "instruction": instruction,
        "term_condition": termCondition,
        "min_price": minPrice,
        "max_price": maxPrice,
        "price_type":
            priceType == null ? null : priceTypeValues.reverse![priceType],
        "prices": prices,
        "suggest_prices": suggestPrices,
        "fee": fee,
      };
}

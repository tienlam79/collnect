import 'dart:convert';

import 'package:omny_locator/models/models.dart';

class ProductRequest {
  ProductRequest({
    required this.filterCode,
    required this.filterType,
  });

  CardType? filterType;
  String filterCode;

  factory ProductRequest.fromRawJson(String str) =>
      ProductRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductRequest.fromJson(Map<String, dynamic> json) => ProductRequest(
        filterCode: json["filter_code"],
        filterType: json["filter_type"] == null
            ? null
            : cardTypeValues.map[json["filter_type"]],
      );

  Map<String, dynamic> toJson() => {
        "filter_type":
            filterType == null ? null : cardTypeValues.reverse![filterType],
        "filter_code": filterCode,
      };
}

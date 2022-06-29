import 'enum_values/price_type.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.sku,
    this.image,
    required this.priceType,
    required this.priceList,
    required this.suggestPriceList,
    this.priceDisplayList,
    this.minPrice,
    this.maxPrice,
    this.destCurrency,
    required this.destAmountList,
    this.description,
    this.termCondition,
    this.extraInfo,
    this.extraInfoImage,
    this.filterCode,
    this.groupName,
    this.feeList,
    this.requiredSpecialInputList,
  });

  int id;
  String name;
  String sku;
  PriceType? priceType;
  List<double> priceList;
  List<double>? feeList;
  List<double> suggestPriceList;
  List<double> destAmountList;
  List<String>? priceDisplayList;
  dynamic description;
  dynamic termCondition;
  final ExtraInfo? extraInfo;
  final extraInfoImage;
  final double? minPrice;
  final double? maxPrice;
  final destCurrency;
  final image;
  String? filterCode;
  String? groupName;
  List<String>? requiredSpecialInputList;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        sku: json["sku"],
        image: json["image"] == null ? null : json["image"],
        priceType: json["price_type"] == null
            ? null
            : priceTypeValues.map[json["price_type"]],
        priceDisplayList: json["price_display_list"] != null
            ? List<String>.from(json["price_display_list"].map((x) => x))
            : null,
        priceList:
            List<double>.from(json["price_list"].map((x) => x.toDouble())),
        feeList: json["fee_list"] == null
            ? null
            : List<double>.from(json["fee_list"].map((x) => x.toDouble())),
        suggestPriceList:
            List<double>.from(json["suggest_price_list"].map((x) => x)),
        minPrice:
            json["min_price"] == null ? null : double.parse(json["min_price"]),
        maxPrice:
            json["max_price"] == null ? null : double.parse(json["max_price"]),
        destCurrency:
            json["dest_currency"] == null ? null : json["dest_currency"],
        destAmountList:
            List<double>.from(json["dest_amount_list"].map((x) => x)),
        description: json["description"] == null ? '' : json["description"],
        termCondition:
            json["term_condition"] == null ? '' : json["term_condition"],
        extraInfo: json["extra_info"] == null
            ? null
            : ExtraInfo.fromJson(json["extra_info"]),
        extraInfoImage:
            json["extra_info_image"] == null ? null : json["extra_info_image"],
        filterCode: json['filter_code'] == null ? null : json['filter_code'],
        groupName: json['group_name'] == null ? null : json['group_name'],
        requiredSpecialInputList: json["required_special_input_list"] != null
            ? List<String>.from(
                json["required_special_input_list"].map((x) => x))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sku": sku,
        "image": image == null ? null : image,
        "price_type":
            priceType == null ? null : priceTypeValues.reverse![priceType],
        "price_display_list": priceDisplayList != null
            ? List<String>.from(priceDisplayList!.map((x) => x))
            : null,
        "price_list": List<double>.from(priceList.map((x) => x)),
        "suggest_price_list": List<double>.from(suggestPriceList.map((x) => x)),
        "min_price": minPrice == null ? null : minPrice,
        "max_price": maxPrice == null ? null : maxPrice,
        "dest_currency": destCurrency == null ? null : destCurrency,
        "dest_amount_list": List<double>.from(destAmountList.map((x) => x)),
        "description": description,
        "term_condition": termCondition,
        "extra_info": extraInfo == null ? null : extraInfo?.toJson(),
        "extra_info_image": extraInfoImage == null ? null : extraInfoImage,
        "filter_code": filterCode == null ? null : filterCode,
        "group_name": groupName == null ? null : groupName,
        "fee_list":
            feeList == null ? null : List<double>.from(feeList!.map((x) => x)),
        "required_special_input_list": requiredSpecialInputList == null
            ? null
            : List<String>.from(requiredSpecialInputList!.map((x) => x))
      };
}

class ExtraInfo {
  ExtraInfo({
    required this.validUntil,
  });

  final String validUntil;

  factory ExtraInfo.fromJson(Map<String, dynamic> json) => ExtraInfo(
        validUntil: json["valid_until"],
      );

  Map<String, dynamic> toJson() => {
        "valid_until": validUntil,
      };
}

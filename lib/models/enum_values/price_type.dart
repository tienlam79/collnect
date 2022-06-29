import 'enum_values.dart';

enum PriceType {
  FIXED,
  OPEN,
}

final priceTypeValues = EnumValues({
  "open": PriceType.OPEN,
  "fixed": PriceType.FIXED,
});

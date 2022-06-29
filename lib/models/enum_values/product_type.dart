import 'enum_values.dart';

enum ProductType {
  DTU,
  ITU,
  PINLESS,
  GIFT_CARD,
  UNLIMITED_MEX,
  UNLIMITED_PHP,
  RELOAD_CARD
}

final productTypeValues = EnumValues({
  "dtu": ProductType.DTU,
  "itu": ProductType.ITU,
  "pinless": ProductType.PINLESS,
  'gift_card': ProductType.GIFT_CARD,
  'unlimited_mex': ProductType.UNLIMITED_MEX,
  "unlimited_php": ProductType.UNLIMITED_PHP,
  "reload_card": ProductType.RELOAD_CARD
});

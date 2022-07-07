import 'package:omny_business/api/api_constants.dart';

enum Flavor { DEV, QA, PRODUCTION }

class FlavorValues {
  FlavorValues({required this.baseUrl});
  final String baseUrl;
}

class FlavorConfig {
  final Flavor flavor;
  final FlavorValues values;
  final String name;

  static FlavorConfig _instance = FlavorConfig._internal(
    Flavor.DEV,
    FlavorValues(
      baseUrl: ApiConstants.baseUrl,
    ),
    'OMNY Retailer Dev',
  );

  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues values,
    required String name,
  }) {
    _instance = FlavorConfig._internal(flavor, values, name);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.values, this.name);

  static FlavorConfig get instance {
    return _instance;
  }

  static bool isProduction() => _instance.flavor == Flavor.PRODUCTION;

  static bool isDevelopment() => _instance.flavor == Flavor.DEV;

  static bool isQA() => _instance.flavor == Flavor.QA;
}

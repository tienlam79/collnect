import 'package:collnect/flavor_config.dart';

class ApiConstants {
  static String baseUrl = FlavorConfig.instance.values.baseUrl;
  static int sku = FlavorConfig.instance.values.sku;
}

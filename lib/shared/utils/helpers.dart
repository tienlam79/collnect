import 'package:omny_business/models/models.dart';

class Helpers {
  // static double? getDestAmount(Product product, double amount) {
  //   List<double> priceList = product.priceType == PriceType.OPEN
  //       ? product.suggestPriceList
  //       : product.priceList;
  //   int priceIndex = priceList.indexWhere((element) => amount == element);
  //   return priceIndex != -1 ? product.destAmountList[priceIndex] : null;
  // }

  static bool checkValidAmount(Product product, double amount) {
    if (product.priceType == PriceType.OPEN) {
      return amount != 0.0 &&
          amount >= (product.minPrice) &&
          amount <= (product.maxPrice);
    }
    return amount != 0.0;
  }
}

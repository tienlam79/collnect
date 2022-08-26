import 'package:intl/intl.dart';
import 'package:collnect/shared/constants/common.dart';

class Formatter {
  static String formatPhoneNumber(String phone, String countryCode) {
    switch (countryCode) {
      case CommonConstants.USCountryCode:
        return phone.replaceAllMapped(RegExp(r'(\d{3})(\d{3})(\d+)'),
            (Match m) => '${m[1]}-${m[2]}-${m[3]}');
      // case CommonConstants.PhilCountryCode:
      // case CommonConstants.MexCountryCode:
      //   final phoneNumber = countryCode + phone;
      //   return phoneNumber.replaceAllMapped(RegExp(r'(\d{2})(\d{4})(\d+)'),
      //       (Match m) => '${m[1]}-${m[2]}-${m[3]}');
      default:
        return '$countryCode-$phone';
    }
  }

  static String removeDecimalZeroFormat(double n) {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    return n.toString().replaceAll(regex, '');
  }

  static String formatLocaleMoney(double amount) {
    final oCcy = new NumberFormat("#,##0.00", "en_US");
    var number = oCcy.format(amount);
    RegExp regex = RegExp(r'([.]*00)(?!.*\d)');
    return number.replaceAll(regex, '');
  }
}

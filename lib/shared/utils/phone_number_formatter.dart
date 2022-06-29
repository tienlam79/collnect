import 'package:flutter/services.dart';

class PhoneNumberTextInputFormatter extends TextInputFormatter {
  final String sample;
  final String separator;
  PhoneNumberTextInputFormatter({
    required this.sample,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    final int sampleTextLength = sample.length;
    final int oldTextLength = oldValue.text.length;
    if (newTextLength > 0) {
      if (newTextLength > oldTextLength) {
        if (newTextLength > sampleTextLength) return oldValue;
        if (newTextLength < sampleTextLength &&
            sample[newTextLength - 1] == separator) {
          return new TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newTextLength - 1)}',
            selection: new TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}

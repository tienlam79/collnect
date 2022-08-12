import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omny_locator/shared/utils/phone_number_formatter.dart';

import '../../constants/constants.dart';
import 'input_field.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formatter;
  final String labelText;
  final String placeholder;
  final Widget? prefix;
  final BoxConstraints? prefixIconConstraints;
  final bool autofocus;
  final TextStyle? style;
  final double? height;
  final String? hintText;
  final TextStyle? labelStyle;
  final String country;
  final int? maxLength;
  final TextStyle? hintStyle;
  final bool readOnly;
  final bool enabled;

  final _mobileFormatter = PhoneNumberTextInputFormatter(
    sample: 'xxx-xxx-xxxx',
    separator: '-',
  );
  PhoneField({
    Key? key,
    required this.controller,
    this.validator,
    this.formatter,
    this.labelText = '',
    this.placeholder = '',
    this.prefix,
    this.prefixIconConstraints,
    this.autofocus = false,
    this.style = const TextStyle(
      fontSize: 44,
      fontWeight: FontWeight.bold,
      height: 1.2,
      color: Colors.black,
    ),
    this.height = 88.0,
    this.hintText,
    this.labelStyle,
    this.country = CommonConstants.USCountryCode,
    this.maxLength,
    this.hintStyle,
    this.readOnly = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.phone,
      formatter: country == CommonConstants.USCountryCode
          ? <TextInputFormatter>[_mobileFormatter]
          : [],
      labelText: labelText,
      placeholder: placeholder,
      prefix: prefix,
      prefixIconConstraints: prefixIconConstraints,
      autofocus: autofocus,
      style: style,
      height: height,
      hintText: hintText,
      labelStyle: labelStyle,
      hintStyle: hintStyle,
      maxLength: maxLength,
      counterText: '',
      readOnly: readOnly,
      enabled: enabled,
    );
  }
}

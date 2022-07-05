import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omny_business/shared/constants/colors.dart';

import 'number_field.dart';

class AmountField extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formatter;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final bool autofocus;
  final String? hintText;
  final String? labelText;

  AmountField({
    this.controller,
    this.placeholder,
    this.validator,
    this.formatter,
    this.focusNode,
    this.onChanged,
    this.autofocus = false,
    this.hintText,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return NumberField(
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged,
      hintText: hintText,
      formatter: formatter,
      height: 88.0,
      labelText: labelText,
      autofocus: autofocus,
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        height: 1.2,
      ),
      prefix: Container(
        child: Text(
          '\$',
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              height: 1.2,
              color: ColorConstants.lightSecodaryTextColor
              // color: ColorConstants.seco,
              ),
        ),
      ),
    );
  }
}

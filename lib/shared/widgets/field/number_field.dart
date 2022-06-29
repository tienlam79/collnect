import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_field.dart';

class NumberField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String placeholder;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formatter;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final BoxConstraints? prefixIconConstraints;
  final Widget? prefix;
  final BoxConstraints? suffixIconConstraints;
  final Widget? suffixIcon;
  final bool autofocus;
  final TextAlign textAlign;
  final double height;
  final TextStyle style;
  final String? hintText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool? enabled;

  NumberField({
    this.controller,
    this.labelText,
    this.placeholder = '',
    this.validator,
    this.formatter,
    this.focusNode,
    this.onChanged,
    this.prefixIconConstraints,
    this.prefix,
    this.autofocus = false,
    this.textAlign = TextAlign.left,
    this.height = 60.0,
    this.suffixIconConstraints,
    this.suffixIcon,
    this.hintText,
    this.style = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    this.maxLines,
    this.keyboardType,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InputField(
      enabled: enabled,
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      controller: controller,
      style: style,
      onChanged: onChanged,
      labelText: labelText,
      placeholder: placeholder,
      prefix: prefix,
      prefixIconConstraints: prefixIconConstraints,
      autofocus: autofocus,
      textAlign: textAlign,
      height: height,
      suffixIconConstraints: suffixIconConstraints,
      suffixIcon: suffixIcon,
      hintText: hintText,
      maxLines: maxLines,
      formatter: formatter,
    );
  }
}

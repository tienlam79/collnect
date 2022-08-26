import 'package:collnect/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? labelText;
  final String placeholder;
  final bool password;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formatter;
  final int? maxLength;
  final int? maxLines;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final BoxConstraints? suffixIconConstraints;
  final Widget? suffixIcon;
  final Widget? prefix;
  final BoxConstraints? prefixIconConstraints;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextStyle? style;
  final bool autocorrect;
  final bool autofocus;
  final TextAlign textAlign;
  final double? height;
  final double? cursorHeight;
  final String? hintText;
  final TextStyle? labelStyle;
  final bool readOnly;
  final String? counterText;
  final TextStyle? hintStyle;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final bool enableSuggestions;
  final bool? enabled;

  InputField({
    this.controller,
    this.keyboardType = TextInputType.text,
    this.labelText,
    this.placeholder = '',
    this.password = false,
    this.validator,
    this.formatter,
    this.maxLength,
    this.maxLines = 1,
    this.onChanged,
    this.suffixIconConstraints,
    this.suffixIcon,
    this.onTap,
    this.prefix,
    this.prefixIconConstraints,
    this.initialValue,
    this.focusNode,
    this.labelStyle,
    this.style = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.2,
    ),
    this.autocorrect = false,
    this.autofocus = false,
    this.textAlign = TextAlign.left,
    this.height = 100.0,
    this.cursorHeight,
    this.hintText,
    this.readOnly = false,
    this.counterText = '',
    this.hintStyle,
    this.textCapitalization = TextCapitalization.none,
    this.obscureText = false,
    this.enableSuggestions = false,
    this.enabled = true,
  });
  @override
  _TextFieldFocusState createState() => _TextFieldFocusState();
}

class _TextFieldFocusState extends State<InputField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.labelText != null)
              Text(
                widget.labelText ?? '',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  color: ColorConstants.lightPrimaryTextColor,
                ),
              ),
            TextFormField(
              enabled: widget.enabled,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              readOnly: widget.readOnly,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: widget.hintText,
                suffixIcon: widget.suffixIcon,
                suffixIconConstraints: widget.suffixIconConstraints,
                prefix: widget.prefix,
                prefixIconConstraints: widget.prefixIconConstraints,
                labelStyle: widget.labelStyle,
                counterText: widget.counterText,
              ),
              style: widget.style,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              autocorrect: widget.autocorrect,
              validator: widget.validator,
              inputFormatters: widget.formatter,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              initialValue: widget.initialValue,
              autofocus: widget.autofocus,
              textAlign: widget.textAlign,
              textCapitalization: widget.textCapitalization,
              enableSuggestions: widget.enableSuggestions,
              obscureText: widget.obscureText,
            ),
          ],
        ));
  }
}

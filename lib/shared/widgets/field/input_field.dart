import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omny_business/shared/constants/colors.dart';

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
      fontSize: 18,
      fontWeight: FontWeight.bold,
      height: 1.2,
      color: Colors.black,
    ),
    this.autocorrect = false,
    this.autofocus = false,
    this.textAlign = TextAlign.left,
    this.height = 60.0,
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
  FocusNode _focus = FocusNode();
  Color _borderColor = ColorConstants.borderInputColor;
  double _borderWidth = 1.0;
  var formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    if (_focus.hasFocus) {
      setState(() {
        _borderColor = ColorConstants.focusedBorderInputColor;
        _borderWidth = 2.0;
      });
    } else {
      setState(() {
        _borderColor = ColorConstants.borderInputColor;
        _borderWidth = 1.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: widget.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: widget.enabled == true
            ? Colors.white
            : ColorConstants.borderInputColor,
        // gradient: LinearGradient(
        //   colors: [
        //     Colors.black,
        //     Colors.pinkAccent,
        //   ],
        // ),
        border: Border.all(
          width: _borderWidth,
          color: _borderColor,
        ),
      ),
      child: TextFormField(
        enabled: widget.enabled,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        focusNode: _focus,
        readOnly: widget.readOnly,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelText: widget.labelText,
          // hintText: _focus.hasFocus ? null : widget.labelText,
          suffixIcon: widget.suffixIcon,
          suffixIconConstraints: widget.suffixIconConstraints,
          prefix: widget.prefix,
          prefixIconConstraints: widget.prefixIconConstraints,
          labelStyle: widget.labelStyle,
          counterText: widget.counterText,
          hintStyle: TextStyle(
            fontSize: 16,
            height: 1.5,
            fontWeight: FontWeight.w400,
          ),
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
    );
  }
}

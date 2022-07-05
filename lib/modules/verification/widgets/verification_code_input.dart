import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class VerificationCodeInput extends StatefulWidget {
  final ValueChanged<String> onCompleted;
  final TextInputType keyboardType;
  final int length;
  final BoxDecoration? itemDecoration;
  final bool autofocus;
  final bool forceUpperCase;
  final Function onChangeCode;
  final double itemWidth;
  final double? itemHeight;
  final double itemMarginLeft;
  VerificationCodeInput({
    Key? key,
    this.forceUpperCase = true,
    required this.onCompleted,
    this.keyboardType = TextInputType.number,
    this.length = 6,
    this.itemDecoration,
    this.itemWidth = 60.0,
    this.itemHeight = 60.0,
    this.autofocus = true,
    this.itemMarginLeft = 10.0,
    required this.onChangeCode,
  })  : assert(length > 0),
        assert(itemWidth > 0),
        super(key: key);

  @override
  _VerificationCodeInputState createState() =>
      new _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {
  final List<FocusNode> _listFocusNode = <FocusNode>[];
  final List<TextEditingController> _listControllerText =
      <TextEditingController>[];
  List<String> _code = [];
  int _currentIdex = 0;
  @override
  void initState() {
    if (_listFocusNode.isEmpty) {
      for (var i = 0; i < widget.length; i++) {
        _listFocusNode.add(new FocusNode());
        _listControllerText.add(new TextEditingController(text: ' '));
        _code.add('');
      }
    }
    super.initState();
  }

  String _getInputVerify() {
    String verifycode = '';
    for (var i = 0; i < widget.length; i++) {
      for (var index = 0; index < _listControllerText[i].text.length; index++) {
        if (_listControllerText[i].text[index] != ' ') {
          verifycode += _listControllerText[i].text[index];
        }
      }
    }
    return verifycode;
  }

  Widget _buildInputItem(int index) {
    return TextFormField(
      autofocus: index == 0,
      controller: _listControllerText[index],
      focusNode: _listFocusNode[index],
      onChanged: (value) => _change(value, index),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.headline1!.copyWith(
            fontSize: 35,
          ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 9.0,
          horizontal: 0.0,
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        //   borderSide: BorderSide(
        //     width: 1.0,
        //   ),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        //   borderSide: BorderSide(
        //     width: 2,
        //   ),
        // ),
      ),
    );
  }

  void _change(String value, int index) {
    print('=== value==== $value - $index');
    if (value.length > 1 && index < widget.length ||
        index == 0 && value.isNotEmpty) {
      if (index == widget.length - 1) {
        widget.onCompleted(_getInputVerify());
        widget.onChangeCode(_getInputVerify());
        return;
      }
      if (_listControllerText[index + 1].value.text.isEmpty) {
        _listControllerText[index + 1].value = new TextEditingValue(text: ' ');
      }
      if (value.length == 2) {
        if (value[0] != _code[index]) {
          _code[index] = value[0];
        } else if (value[1] != _code[index]) {
          _code[index] = value[1];
        }
        if (value[0] == " ") {
          _code[index] = value[1];
        }
        _listControllerText[index].text = _code[index];
      }
      _next(index);

      widget.onChangeCode(_getInputVerify());

      return;
    }
    if (value.isEmpty && index > 0) {
      if (_listControllerText[index - 1].value.text.isEmpty) {
        _listControllerText[index - 1].value = new TextEditingValue(text: " ");
      }
      widget.onChangeCode(_getInputVerify());
      _prev(index);
    }
  }

  void _next(int index) {
    if (index != widget.length) {
      setState(() {
        _currentIdex = index + 1;
      });
      SchedulerBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(_listFocusNode[index + 1]);
      });
    }
  }

  void _prev(int index) {
    if (index > 0) {
      setState(() {
        if (_listControllerText[index].text.isEmpty) {
          _listControllerText[index - 1].text = ' ';
        }
        _currentIdex = index - 1;
      });
      SchedulerBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(_listFocusNode[index - 1]);
      });
    }
  }

  List<Widget> _buildListWidget() {
    List<Widget> listWidget = [];
    for (int index = 0; index < widget.length; index++) {
      double left = (index == 0) ? 0.0 : widget.itemMarginLeft;
      listWidget.add(
        Container(
          height: widget.itemHeight,
          width: widget.itemWidth,
          margin: EdgeInsets.only(left: left),
          decoration: widget.itemDecoration,
          child: _buildInputItem(index),
        ),
      );
    }
    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildListWidget(),
        ));
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text,
      selection: newValue.selection,
    );
  }
}

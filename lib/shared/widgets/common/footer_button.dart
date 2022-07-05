import 'package:flutter/material.dart';
import 'package:omny_business/shared/constants/constants.dart';
import 'package:omny_business/shared/widgets/button/primary_button.dart';

class FooterButton extends StatelessWidget {
  const FooterButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.disabled = false,
  }) : super(key: key);

  final Function onPressed;
  final bool disabled;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: ColorConstants.lightScaffoldBackgroundColor,
      padding: const EdgeInsets.fromLTRB(CommonConstants.hPadding, 0,
          CommonConstants.hPadding, CommonConstants.hPadding),
      child: PrimaryButton(
        text: text,
        disabled: disabled,
        onPressed: onPressed,
      ),
    );
  }
}

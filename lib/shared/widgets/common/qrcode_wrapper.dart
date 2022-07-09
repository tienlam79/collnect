import 'package:flutter/material.dart';
import 'package:omny_locator/shared/constants/common.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeWrapper extends StatelessWidget {
  QrCodeWrapper({
    Key? key,
    required this.size,
    required this.value,
  }) : super(key: key);
  final double size;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(CommonConstants.borderRadius),
      ),
      child: QrImage(
        data: value,
        version: QrVersions.auto,
        padding: EdgeInsets.zero,
        size: size,
      ),
    );
  }
}

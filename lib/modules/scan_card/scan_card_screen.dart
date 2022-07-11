import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/routes/app_pages.dart';
import 'package:omny_locator/shared/shared.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'scan_card_sample.dart';

class ScanCardScreen extends StatefulWidget {
  const ScanCardScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<ScanCardScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void didUpdateWidget(ScanCardScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleText: 'scan_bar_code'.tr,
      scrollable: false,
      resizeToAvoidBottomInset: false,
      bodyPadding: const EdgeInsets.all(0),
      child: Stack(
        children: <Widget>[
          Container(
            height: Get.height,
            width: Get.width,
            child: _buildQrView(context),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            alignment: Alignment.topCenter,
            child: Text(
              'scan_omny_card_desc'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(30.0),
            alignment: Alignment.bottomCenter,
            child: GradientButton(
              text: 'how_to_scan_omny_card'.tr,
              onPressed: howToUse,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: ColorConstants.primaryColor,
        borderRadius: 10,
        borderLength: 20,
        borderWidth: 10,
        cutOutSize: Get.width,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController c) {
    if (controller == null) {
      if (Platform.isAndroid) {
        c.pauseCamera();
      }
      c.resumeCamera();
    }
    setState(() {
      controller = c;
    });
    c.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        Get.offNamed(Routes.PRE_ORDER_OMNY_CARD, arguments: [scanData.code]);
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void howToUse() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => ScanCardSample(),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

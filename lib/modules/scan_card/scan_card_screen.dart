import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_business/modules/activated_card/activated_card_controller.dart';
import 'package:omny_business/routes/app_pages.dart';
import 'package:omny_business/shared/shared.dart';
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
  ActivatedCardController reloadCardController = Get.arguments;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
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
          // Container(
          //   margin: const EdgeInsets.all(30.0),
          //   alignment: Alignment.bottomCenter,
          //   child: ElevatedButton.icon(
          //     style: ElevatedButton.styleFrom(
          //       elevation: 0,
          //       primary: ColorConstants.primaryColor,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(14),
          //       ),
          //       minimumSize: Size.fromHeight(50),
          //     ),
          //     onPressed: howToUse,
          //     // icon: Icon(Icons.help_outline),
          //     label: Text('how_to_scan_omny_card'.tr),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    // var scanArea = (MediaQuery.of(context).size.width < 400 ||
    //         MediaQuery.of(context).size.height < 400)
    //     ? 150.0
    //     : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
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
    var parentController = Get.arguments;
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
        parentController.setCode(scanData.code);
        Get.until((route) => route.settings.name == Routes.ACTIVATED_CARD);
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

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omny_locator/models/order.dart';
import 'package:omny_locator/shared/shared.dart';

class PreOrderQrCode extends StatelessWidget {
  PreOrderQrCode({
    Key? key,
    required this.order,
    required this.onFindLocation,
  }) : super(key: key);
  final Order order;
  final Function() onFindLocation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'show_qr_code_desc'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SpacingSm(),
        InkWell(
          onTap: onFindLocation,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageConstants.homeIcon,
                width: 20,
                height: 20,
              ),
              SizedBox(
                width: 8,
              ),
              GradientText(
                'find_location_near_you'.tr,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
        SpacingMd(),
        QrCodeWrapper(
          padding: const EdgeInsets.all(24),
          size: 275.0,
          value:
              '${order.id}-${order.customerPhone}-${order.customerName}-${order.amount}',
        ),
        SpacingXs(),
        TextButton(
          onPressed: () => {},
          child: Text(
            'save_qr_code'.tr,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: ColorConstants.primaryColor),
          ),
        ),
      ],
    );
  }

  void saveImageToGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      CommonWidget.toast('saving in progress...');
      await GallerySaver.saveImage(pickedFile.path);
      CommonWidget.toast('image saved!');
    }
  }
}

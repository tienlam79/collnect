import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:omny_locator/shared/shared.dart';
import 'comment_controller.dart';

class CommentScreen extends GetView<CommentController> {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainListWidget(
      titleText: 'leave_comment'.tr,
      titleSpacing: CommonConstants.titleSpacing,
      footer: Obx(() => GradientButton(
            text: 'submit'.tr,
            onPressed: controller.onSubmit,
            disabled: controller.rating.value == 0.0 &&
                controller.comment.value == '',
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildComment(context),
          SpacingSm(),
          _buildRating(context),
          SpacingSm(),
          Obx(
            () => Visibility(
              child: _buildPreviewImages(context),
              visible: controller.imageFiles.length > 0,
            ),
          ),
          Obx(
            () => Visibility(
              child: _buildAddPhoto(context),
              visible: controller.imageFiles.length <= 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComment(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(text: 'your_comment'.tr),
        SpacingSm(),
        InputField(
          labelText: '',
          controller: controller.commentController,
          maxLines: 10,
          height: 150,
        ),
      ],
    );
  }

  Widget _buildRating(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(text: 'rating'.tr),
        SpacingSm(),
        RatingBar.builder(
          initialRating: controller.rating.value,
          minRating: 1,
          itemSize: 24,
          direction: Axis.horizontal,
          unratedColor: hexToColor('#99B2FE'),
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: ColorConstants.primaryColor,
          ),
          onRatingUpdate: controller.onChangeRating,
        ),
      ],
    );
  }

  Widget _buildAddPhoto(BuildContext context) {
    return InkWell(
      onTap: controller.getImageFromGallery,
      child: Container(
        width: 108,
        height: 108,
        decoration: BoxDecoration(
          color: hexToColor('#e0e0e0'),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_photo_alternate, color: ColorConstants.primaryColor),
            SpacingXs(),
            GradientText(
              'add_photo'.tr,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewImages(BuildContext context) {
    return Container(
      height: 108,
      margin: const EdgeInsets.only(bottom: 8),
      child: Obx(
        () => ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: _buildPreviewImageItem,
          itemCount: controller.imageFiles.length,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 8,
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewImageItem(BuildContext context, int index) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          width: 108,
          height: 108,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              File(controller.imageFiles[index].path),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            icon: Icon(
              Icons.highlight_off,
              color: ColorConstants.primaryColor,
            ),
            onPressed: () => controller.onRemoveImage(index),
          ),
        ),
      ],
    );
  }
}

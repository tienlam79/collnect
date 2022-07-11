import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omny_locator/models/store.dart';
import 'package:omny_locator/modules/home/widgets/nearby_store_item.dart';
import 'package:omny_locator/shared/shared.dart';

class NearbyStoreList extends StatelessWidget {
  NearbyStoreList({
    Key? key,
    required this.stores,
    required this.scrollController,
    required this.sortByOption,
    required this.sortByOptions,
    required this.onChangeSort,
  });

  final RxList<Store> stores;
  final ScrollController scrollController;
  final String sortByOption;
  final List<DropdownMenuItem<String>> sortByOptions;
  final Function(String? value) onChangeSort;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SectionTitle(text: 'store_near_you'.tr),
            ),
            _buildSortBy(context),
          ],
        ),
        Obx(
          () => stores.length == 0
              ? EmptyList(
                  image: ImageConstants.emptyHistory,
                  title: 'no_nearby_store'.tr,
                )
              : ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) =>
                      SpacingXs(),
                  controller: scrollController,
                  itemCount: stores.length,
                  itemBuilder: (BuildContext context, int index) =>
                      NearbyStoreItem(
                    store: stores[index],
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildSortBy(BuildContext context) {
    return DropdownButton<String>(
      value: sortByOption,
      elevation: 16,
      style: Theme.of(context).textTheme.subtitle1,
      iconEnabledColor: Colors.black,
      underline: Container(
        height: 0,
      ),
      onChanged: onChangeSort,
      items: sortByOptions,
    );
  }
}

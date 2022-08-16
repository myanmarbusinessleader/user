import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mmbl/model/business_listing.dart';
import 'package:mmbl/utils/router/router.dart';

import '../../../controller/filter_form_controller.dart';
import '../controller/manage_business_controller.dart';

class ManageBusinessView extends StatelessWidget {
  const ManageBusinessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FilterFormController fController = Get.find();
    final ManageBusinessController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manage Businesses",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              wordSpacing: 1
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: controller.editingController,
              onChanged: controller.onSearch,
              // onSubmitted: homeController.searchItem,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Search",
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.editingController.clear();
                      controller.clear();
                    },
                    icon: const Icon(Icons.clear),
                  )),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                final itemsList = controller.isSearch.value ?
                controller.searchitems.map((element) => element).toList()
                : fController.businessList.map((element) => element).toList();
                return ListView.builder(
                itemCount: itemsList.length,
                itemBuilder: (_, i) {
                  final business = BusinessListing.fromJson(itemsList[i]);
                  return SwipeActionCell(
                  key: ValueKey(business.id),
                  trailingActions: [
                    SwipeAction(
                      onTap: (CompletionHandler _) async {
                        await _(true);
                        await controller.delete(business.id);
                      },
                      title: 'Delete',
                    ),
                    SwipeAction(
                      color: Colors.grey,
                      onTap: (CompletionHandler _) async {
                        await _(false);
                        fController.setEditedBL(business);
                        await Get.toNamed(updateBusinessScreen);
                      },
                      title: 'Edit',
                    ),
                  ],
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 140,
                    child: Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: business.businessLogo.imagePath,
                            width: 100,
                            height: 125,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  business.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  business.categoryID,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
                }
              );
              }
            ),
          )
        ],
      ),
      floatingActionButton: IconButton(
        onPressed: () => Get.toNamed(addBusinessScreen), 
        icon: const Icon(FontAwesomeIcons.circlePlus,color: Colors.white,size: 45),
        )
    );
  }
}

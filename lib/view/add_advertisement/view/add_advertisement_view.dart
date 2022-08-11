import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/controller/filter_form_controller.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:mmbl/view/add_advertisement/controller/add_advertisement.dart';

class ManageAdvertisementView extends StatelessWidget {
  const ManageAdvertisementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddAdvertisementController controller = Get.find();
    final FilterFormController fController = Get.find();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //Form
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //NameTextField
                  TextField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      hintText: "Enter description name (Optional)",
                    ),
                  ),
                  //ImageButton //Switch
                  
                  Column(
                    children: [
                      Obx(
                        () {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: controller.isFirstTimePreesed.value && 
                                controller.isPickedImageEmpty.value ?
                                 Colors.red : Colors.white.withOpacity(0),
                              )
                            ),
                            child: IconButton(
                              onPressed: () => controller.getImage(), 
                              icon: const Icon(Icons.photo,color: Colors.black,size: 35)
                              ),
                          );
                        }
                      ),
                      const Text("Pick Image")
                    ],
                  ),
                      
                  const SizedBox(height: 5,),
                  //Save
                  Obx(
                     () {
                      return Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: size.width * 0.7,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () => controller.saveAdvertisement(), 
                            child: controller.isLoading.value ?
                            const CircularProgressIndicator(
                              color: Colors.white,
                            ): const Text("Save")
                            ),
                        ),
                      );
                    }
                  ),
                ],
              ),
              ),
          ),
          //CategoryList
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  itemCount: fController.advertisementList.length,
                  itemBuilder: (context,index){
                    final advertisement = fController.advertisementList[index];
                    return SwipeActionCell(
                      key: ValueKey(advertisement.id),
                      trailingActions: [
                        SwipeAction(
                          onTap: (CompletionHandler _) async {
                            await _(true);
                            await controller.deleteAdvertisement(advertisement.id);
                          },
                          title: 'Delete',
                        ),
                      ],
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(advertisement.name ?? "Name is empty",
                          style: Theme.of(context).textTheme.titleMedium),
                        ),
                      ),
                    );
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
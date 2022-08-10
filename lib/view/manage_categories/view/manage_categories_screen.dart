import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/controller/filter_form_controller.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:mmbl/model/category.dart';
import 'package:mmbl/view/manage_categories/controller/manage_categories_controller.dart';

class ManageCategoriesScreen extends StatelessWidget {
  const ManageCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ManageCategoriesController controller = Get.find();
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
                      hintText: "Enter category name",
                    ),
                  ),
                  //ImageButton //Switch
                  Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () => controller.getImage(), 
                            icon: const Icon(Icons.photo,color: Colors.black,size: 35)
                            ),
                          const Text("Pick Image")
                        ],
                      ),
                      const SizedBox(width: 25,),
                      Column(
                        children: [
                          Obx(() => Switch(
                            value: controller.isGrid.value, 
                            onChanged: (value) => controller.changeIsGrid(value),
                            ),),
                          const Text("GridView")
                        ],
                      ),
                    ],
                  ),
                  //Save
                  Obx(
                     () {
                      return Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: size.width * 0.7,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () => controller.saveCategory(), 
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
                  itemCount: fController.categoryList.length,
                  itemBuilder: (context,index){
                    final category = Category.fromJson(fController.categoryList[index]);
                    return SwipeActionCell(
                      key: ValueKey(category.id),
                      trailingActions: [
                        SwipeAction(
                          onTap: (CompletionHandler _) async {
                            await _(true);
                            await controller.deleteCategory(category.id);
                          },
                          title: 'Delete',
                        ),
                        SwipeAction(
                          color: category.isGrid! ? Colors.green : Colors.grey,
                          onTap: (CompletionHandler _) async {
                            await _(true);
                            await controller.updateCategory(category.id, !category.isGrid!);
                          },
                          title: 'isGrid',
                        ),
                      ],
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(category.name,
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
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mmbl/constant/constant.dart';
import 'package:mmbl/controller/filter_form_controller.dart';
import 'package:mmbl/model/category.dart';
import 'package:uuid/uuid.dart';

class ManageCategoriesController extends GetxController {
  final FilterFormController _controller = Get.find();
  final TextEditingController nameController = TextEditingController();
  Rxn<String?> cateImage = Rxn<String?>(null);
  var isLoading = false.obs;
  var isGrid = false.obs;

  void changeIsGrid(bool value) => isGrid.value = value;
  Future<void> getImage() async {
  try {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    cateImage.value = image!.path;
  } catch (e) {
    debugPrint("Error Image Picking");
  }
}

Future<void> saveCategory() async{
  if(isLoading.value){
    return;
  }
  isLoading.value = true;
  try {
    final id = Uuid().v1();
    final categoryImage = cateImage.value == null ? 
    null : await getDownLoadImage(cateImage.value,id);
    final category = Category(
        id: id, 
        name: nameController.text,
        isGrid: isGrid.value, 
        image: categoryImage,
        searchList: [],
        );
    FirebaseFirestore.instance.collection(
      categoryCollection
    ).doc(id)
    .set(
      category.toJson()
    ).then((value){
      _controller.categoryList.add(category.toJson());
    });
  } catch (e) {
    debugPrint("Saving Error in $e");
  }
}

 Future<void> updateCategory(String id,bool value) async{
    try {
      await FirebaseFirestore.instance.collection(categoryCollection)
      .doc(id)
      .update({
        "isGrid": value,
      });
    } catch (e) {
      Get.snackbar("Fail","Try again!");
      debugPrint("Updating Error $e");
    }
 }

 Future<void> deleteCategory(String id) async{
  final removeData = _controller.categoryList.where((p0) => p0["id"] == id).first;
  try {
    _controller.categoryList.remove(removeData);
    FirebaseFirestore.instance.collection(categoryCollection)
    .doc(id)
    .delete();
  } catch (e) {
    _controller.categoryList.add(removeData);
    debugPrint("Deleting Error $e");
  }
 }
 
  getDownLoadImage(String? value,String id) async{
    final file = File(value!);
    final snapshot =  await FirebaseStorage.instance
            .ref()
            .child("categories/$id")
            .putFile(file);
    final image = await snapshot.ref.getDownloadURL();
    return image;
  }
}
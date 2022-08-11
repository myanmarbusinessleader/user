import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mmbl/constant/constant.dart';
import 'package:mmbl/model/advertisement.dart';
import 'package:uuid/uuid.dart';

class AddAdvertisementController extends GetxController{
  TextEditingController nameController = TextEditingController();
  var pickedImage = "".obs;
  var isLoading = false.obs;
  var isPickedImageEmpty = false.obs;
  var isFirstTimePreesed = false.obs;

  Future<void> getImage() async {
  try {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    pickedImage.value = image!.path;
    isPickedImageEmpty.value = false;
  } catch (e) {
    isPickedImageEmpty.value = true;
    debugPrint("Error Image Picking");
  }
}

 Future<void> deleteAdvertisement(String id) async{
  try {
    await FirebaseFirestore.instance.collection(advertisementCollection)
    .doc(id)
    .delete();
  } catch (e) {
    Get.snackbar("Fail","");
    debugPrint("*******Delete Advertisement Error: $e");
  }
 }
  
  Future<void> saveAdvertisement() async{
    isFirstTimePreesed.value = true;
    if(pickedImage.value.isEmpty){
      isPickedImageEmpty.value = true;
      return;
    }
    if(isLoading.value) return;
    isLoading.value = true;
   final file = File(pickedImage.value);
    final id =  Uuid().v1();
      try {
        await FirebaseStorage.instance
            .ref()
            .child("advertisement/$id")
            .putFile(file)
            .then((snapshot) async {
            await snapshot.ref.getDownloadURL()
            .then((imageString) async{
               await FirebaseFirestore.instance.collection(advertisementCollection)
               .doc(id)
               .set(
                Advertisement(
                  id: id, 
                  image: imageString,
                  name: nameController.text,
                  dateTime: DateTime.now(),
                  )
                .toJson()
               );
               isLoading.value = false;
               isFirstTimePreesed.value = false;
               isPickedImageEmpty.value = false;
               nameController.clear();
                Get.back();
                Get.snackbar("Success","");
            });
            });
      }catch(e){
        isLoading.value = false;
        Get.snackbar("Fail","");
        debugPrint("*******Save Advertisement Error: $e");
      }
  }
}
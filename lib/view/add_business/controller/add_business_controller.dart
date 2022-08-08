import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart' hide GeoPoint;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/constant/constant.dart';
import 'package:mmbl/model/business_listing.dart';
import 'package:mmbl/model/form_object.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mmbl/view/widgets/show_location_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../constant/state.dart';
import '../../../service/database.dart';

class AddBusinessController extends GetxController {
  final _database = Database();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  RxMap<String,Rxn<FormObject>> inputMap = <String,Rxn<FormObject>>{}.obs;
  var isFirstTimePress = false.obs;
  var state = allStates.obs;
  var township = allTownship.obs;
  var category = allCategory.obs;
  var businessLogo = "".obs;
  var isLoading = false.obs;
  RxList<String> geoPoint = <String>[].obs;
  
  @override
  void onInit() {
    inputMap.value = {
      "Business Name": Rxn<FormObject>(
               FormObject.initial().copyWith(isRequired: true,
               error: "Business Name is required")
                      ),
      "Business Phone Number": Rxn<FormObject>(
               FormObject.initial()
                      ),
      "Business Email": Rxn<FormObject>(
               FormObject.initial()
                      ),
      "Website": Rxn<FormObject>(
               FormObject.initial()
                      ),
      "Business Address": Rxn<FormObject>(
               FormObject.initial().copyWith(isRequired: true,
               error: "Business Address is required"),
                      ),
      "Contact Person Name": Rxn<FormObject>(
               FormObject.initial().copyWith(isRequired: true,
               error: "Contact Person Name is required"),
                      ),
      "Contact Phone Number": Rxn<FormObject>(
               FormObject.initial().copyWith(isRequired: true,
               error: "Contact Phone Number is required"),
                      ),
      "Contact Email": Rxn<FormObject>(
               FormObject.initial()
                      ),                                
    };
    super.onInit();
  }
  
  void setState(String value) => state.value = value;
  void setTownship(String value) => township.value = value;
  void setCategory(String value) => category.value = value;
  void setBusinessLogo(String value) => businessLogo.value = value;
  void setGeopoint(List<String> value) => geoPoint.value = value;
  Future<void> getGeopoint() async{
    showLocationPicker(
                      context: Get.context!,
                      isDismissible: true,
                      title: "Pick your location!",
                      textConfirmPicker: "pick",
                      initCurrentUserPosition: true,
                    ).then((value){
                      if(!(value == null)){
                        geoPoint.value = ["${value.latitude}","${value.longitude}"];
                        debugPrint("Lat,Lon ${geoPoint[0]},${geoPoint[1]}");
                      }
                    });
  }

  void formObjectValidation(String key,String inputValue){
      final value = inputMap[key]!;
      inputMap[key]!.value = value.value!.copyWith(value: inputValue);
      
      if(value.value!.isRequired == true){
        if(value.value!.value.isEmpty){
          debugPrint("required");
          inputMap[key]!.value = value.value!.copyWith( error: "$key is required");
          
        }else{
          inputMap[key]!.value = value.value!.copyWith(
            error: ""
          );
        }
      }
     
  }

  bool validate(){
    isFirstTimePress.value = true;
    final reqData = inputMap.values.where((element) => element.value?.isRequired == true);
    final resultData = reqData.where((element){
      debugPrint("***${element.value?.error}");
      return element.value?.error.isNotEmpty == true;
    });
    if(resultData.isNotEmpty || !validPickData()){
      debugPrint("****INVALID");
      return false;
    }else{
      debugPrint("****VALID");
      return true;
    }
  }

  bool validPickData() => (state.value != allStates)  && 
                          (township.value != allTownship) &&
                          (category.value != allCategory) &&
                           geoPoint.isNotEmpty &&
                           businessLogo.isNotEmpty;

  bool checkHasError(String key){
    return inputMap[key]!.value!.isRequired &&
                          inputMap[key]!.value!.error.isNotEmpty && isFirstTimePress.value;
  }

  Query<Map<String, dynamic>> searchTownship(String? value) {
    if(value == null || value.isEmpty){
    return FirebaseFirestore.instance.collection( mockState[state.value]!) .orderBy("name");
    }else{
      return FirebaseFirestore.instance.collection(mockState[state.value]!,)
            .where("searchList", arrayContainsAny: [value])
            .orderBy("name");
    }
  }

 Future<void> getImage() async {
  try {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    businessLogo.value = image!.path;
  } catch (e) {
    debugPrint("Error Image Picking");
  }
}
 Future<void> saveBusinessListing() async{
  if(isLoading.value){
    return;
  }
  final file = File(businessLogo.value);
  final id =  Uuid().v1();
  isLoading.value = true;
      try {
        await _firebaseStorage
            .ref()
            .child("business/$id")
            .putFile(file)
            .then((snapshot) async {
            await snapshot.ref.getDownloadURL()
            .then((value) async{
              final temp = getNameList(inputMap["Business Name"]!.value!.value);
              await _database.write(
                collectionPath: businesses, 
                documentPath: id,
                data: BusinessListing(
                  name: inputMap["Business Name"]!.value!.value,
                  phoneNumber: inputMap["Business Phone Number"]!.value!.value,
                  email: inputMap["Business Email"]!.value!.value,
                  website: inputMap["Website"]!.value!.value,
                  businessAddress: inputMap["Business Address"]!.value!.value,
                  state: state.value,
                  township: township.value,
                  categoryID: category.value,
                  contactPersonName: inputMap["Contact Person Name"]!.value!.value,
                  contactPhoneNumer: inputMap["Contact Phone Number"]!.value!.value,
                  contactEmail: inputMap["Contact Email"]!.value!.value,
                  businessLogo: value,
                  geoPoint: geoPoint,
                  searchList: temp,
                  ).toJson(),
                );
                isLoading.value = false;
                Get.back();
                Get.snackbar("Success","");
            });
          });
      }catch(e){
        isLoading.value = false;
        Get.snackbar("Fail","");
        debugPrint("*******Business Listing Error: $e");
      }
        
  }

  List<String> getNameList(String element){
    final List<String> tempList = [];
      String temp = "";
      for (var i = 0; i < element.length; i++) {
        temp = temp + element[i];
        tempList.add(temp);
      }
    return tempList;
  }
}
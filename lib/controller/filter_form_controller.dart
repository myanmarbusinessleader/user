import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/constant/constant.dart';
import 'package:mmbl/constant/state.dart';
import '../service/database.dart';


class FilterFormController extends GetxController {
  final TextEditingController ePController = TextEditingController();
  final _database = Database();
  var category = allCategory.obs;
  var state = allStates.obs;
  var township = allTownship.obs;
  var tabIndex = 0.obs;
  
  
  void changeCategory(String value) => category.value = value;
  void changeState(String value) => state.value = value;
  void changeTownship(String value) => township.value = value;
  void changeTabIndex(int value){
    tabIndex.value = value;
    if(value == 0){
      state.value = allStates;
      township.value = allTownship;
      category.value = allCategory;
    }
  }

  /* writeStates() async{
    for (var element in mockState) {
      final tempList = getCategoryNameList(element["name_mm"] as String);
      await _database.write(
        collectionPath: stateCollection, 
        data: {
          "name": element["name_mm"] as String,
          "searchList": tempList,
        },
        );
    }
  }

  writeTownship() async{
    for (var i = 0; i < mockTownship.length; i++) {
      final eachTownList = mockTownship[i];
      final eachState = mockState[i];
      //Looping for townList
      for (var element in eachTownList) {
        final tempList = getCategoryNameList(element["name_mm"] as String);
        await FirebaseFirestore.instance
        .collection("township")
        .doc(eachState["name_en"] as String)
        .collection(eachState["name_en"] as String)
        .doc()
        .set({
          "name": element["name_mm"] as String,
          "searchList": tempList,
        });
        
      }
    }
  } */

  /* writeMockCategories() async{
    for (var element in mockCategories) {
      final uuid = Uuid().v1();
      final tempList = getCategoryNameList(element);
      await _database.write(
        collectionPath: categories, 
        documentPath: uuid, 
        data: Category(
          id: uuid, 
          name: element,
          searchList: tempList,
          )
        .toJson(),
        );
    }
  } */

  Query<Map<String, dynamic>> search(String? value) {
    if(value == null || value.isEmpty){
    return FirebaseFirestore.instance.collection(categories)
            .orderBy("name");
    }else{
      return FirebaseFirestore.instance.collection(categories)
            .where("searchList", arrayContainsAny: [value])
            .orderBy("name");
    }
  }

  Query<Map<String, dynamic>> searchState(String? value) {
    if(value == null || value.isEmpty){
    return FirebaseFirestore.instance.collection(stateCollection)
            .orderBy("name");
    }else{
      return FirebaseFirestore.instance.collection(stateCollection)
            .where("searchList", arrayContainsAny: [value])
            .orderBy("name");
    }
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

  Query<Map<String, dynamic>> searchBusiness(
    String? value,
    ) {
         if(value == null || value.isEmpty){
    return FirebaseFirestore.instance.collection(businesses)
            .orderBy("name");
    }else{
      return FirebaseFirestore.instance.collection(businesses)
            .where("searchList", arrayContainsAny: [value])
            .orderBy("name");
    }
      }

  

  List<String> getCategoryNameList(String element){
    final List<String> tempList = [];
      String temp = "";
      for (var i = 0; i < element.length; i++) {
        temp = temp + element[i];
        tempList.add(temp);
      }
    return tempList;
  }
}
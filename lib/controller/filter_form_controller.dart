import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/constant/constant.dart';
import 'package:mmbl/constant/state.dart';
import 'package:mmbl/constant/township.dart';
import '../service/database.dart';


class FilterFormController extends GetxController {
  final TextEditingController ePController = TextEditingController();
  RxList<Map<String,dynamic>> categoryList = <Map<String,dynamic>>[].obs;
  RxList<Map<String,dynamic>> businessList = <Map<String,dynamic>>[].obs;
  final _database = Database();
  var category = allCategory.obs;
  var state = allStates.obs;
  var township = allTownship.obs;
  var tabIndex = 0.obs;

  @override
  void onInit() {
    getCategories();
    getBusinesses();
    super.onInit();
  }

  Future<void> getBusinesses() async{
    final result = await _database.getRequestCollection(collectionPath: businesses);
    var busList = result.docs.map((e) => e.data()).toList();
    busList.sort((a,b) => a["name"].compareTo(b["name"]));
    businessList.value = busList;
  }
  
  Future<void> getCategories() async{
    final result = await _database.getRequestCollection(collectionPath: categoryCollection);
    var catList = result.docs.map((e) => e.data()).toList();
    catList.sort((a,b) => a["name"].compareTo(b["name"]));
    categoryList.value = catList;
  }
  
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

  Future<List<Map<String, dynamic>>> search(String? value) async{
    await Future.delayed(const Duration(milliseconds: 500));
    if(value == null || value.isEmpty){
      return categoryList;
    }else{
      final whereResult = categoryList.where((e) => e["name"].startsWith(value));
      return whereResult.toList();
    }
  }

  Future<List<Map<String, dynamic>>> searchState(String? value) async{
    await Future.delayed(const Duration(milliseconds: 500));
    var mock = stateMap;
    mock.sort((a,b) => a["name"]!.compareTo(b["name"]!));
    if(value == null || value.isEmpty){
    
    return mock;
    }else{
      return mock.where((element) => element["name"]!.startsWith(value)).toList();
    }
  }

  Future<List<Map<String, dynamic>>> searchTownship(String? value) async{
    await Future.delayed(const Duration(milliseconds: 500));
    var mock = townshipMap[state.value];
    mock!.sort((a,b) => a["name"]!.compareTo(b["name"]!));
    if(value == null || value.isEmpty){
    return mock;
    }else{
      return mock.where((element) => element["name"]!.startsWith(value)).toList();
    }
  }

  Future<List<Map<String, dynamic>>> searchBusiness(
    String? value,
    ) async{
      await Future.delayed(const Duration(milliseconds: 500));
         if(value == null || value.isEmpty){
    return businessList;
    }else{
      return businessList.where((e){
        final name = e["name"] as String;
        return name.startsWith(value) || name.contains(value);
      }).toList();
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
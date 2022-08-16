import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/controller/filter_form_controller.dart';
import 'package:mmbl/model/business_listing.dart';

import '../../../constant/constant.dart';

class ManageBusinessController extends GetxController {
  final FilterFormController controller = Get.find();
  final TextEditingController editingController = TextEditingController();
  var isSearch = false.obs;
  RxList<Map<String,dynamic>> searchitems = <Map<String,dynamic>>[].obs;

  void onSearch(String name) {
    isSearch.value = true;
    searchitems.value = controller.businessList.where((e) 
    => e["name"].toLowerCase().contains(name.toLowerCase()))
    .toList();
  }

  void clear(){
    isSearch.value = false;
    searchitems.clear();
  }

  Future<void> delete(String path) async {
    try {
      await FirebaseFirestore.instance.collection(businesses)
      .doc(path)
      .delete();
    } catch (e) {
      print(e);
    }
  }
}

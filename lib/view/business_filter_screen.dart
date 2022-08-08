import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/controller/filter_form_controller.dart';
import 'package:mmbl/utils/widgets/search_widget.dart';

import '../model/business_listing.dart';
import '../utils/other/debounce.dart';
import 'widgets/business_filter_search_list.dart';

class BusinessFilterScreen extends StatefulWidget {
  final String appBarTitle;
  final String hintText;
  final void Function(BusinessListing) onSelected;
  final Future<List<Map<String, dynamic>>> Function(String?) search;
  const BusinessFilterScreen({Key? key,required this.appBarTitle,
  required this.hintText,
  required this.search,
  required this.onSelected}) : super(key: key);

  @override
  State<BusinessFilterScreen> createState() => _BusinessFilterScreenState();
}

class _BusinessFilterScreenState extends State<BusinessFilterScreen> {
  final debouncer = Debouncer(milliseconds: 500);
  final FilterFormController _controller = Get.find();
  String? searchValue;

  @override
  void initState() {
    searchValue = _controller.ePController.text;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white,size: 35,),
          centerTitle: true,
          title:  Text(_controller.category.value,
          style: const TextStyle(color: Colors.white,)),
        ),
      body: Column(
        children: [
          SearchWidget(
        size: size,
        onChanged: (value){
          setState(() {
            searchValue = value;
          });
        }, 
        debouncer: debouncer, 
        hintText: widget.hintText,
        ),
        BusinessFilterSearchList(
          searchValue: searchValue, 
          search: widget.search, 
          onSelected: widget.onSelected,
          )
        ],
      )    
    );
  }
}
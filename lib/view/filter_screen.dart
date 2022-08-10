import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/utils/widgets/search_widget.dart';
import 'package:mmbl/view/widgets/filter_search_list.dart';

import '../utils/other/debounce.dart';

class FilterScreen extends StatefulWidget {
  final String appBarTitle;
  final String hintText;
  final void Function(String) onSelected;
  final Future<List<Map<String, dynamic>>> Function(String?) search;
  const FilterScreen({Key? key,required this.appBarTitle,
  required this.hintText,
  required this.search,
  required this.onSelected}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final debouncer = Debouncer(milliseconds: 500);
  String? searchValue;

  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:  AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white,size: 35,),
          centerTitle: true,
          title:  Text(widget.appBarTitle,
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
        FilterSearchList(
          searchValue: searchValue, 
          search: widget.search, 
          onSelected: (value){
            widget.onSelected(value);
            Get.back();
          },
          )
        ],
      )    
    );
  }
}
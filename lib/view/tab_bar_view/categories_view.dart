import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbl/controller/filter_form_controller.dart';

import '../../utils/other/debounce.dart';
import '../../utils/widgets/search_widget.dart';
import '../widgets/caregory_search_list.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  String? searchValue;
  final debouncer = Debouncer(milliseconds: 500);
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final FilterFormController controller = Get.find();
    return Column(
      children: [
        //
        SearchWidget(
          size: size, 
          hintText: "လုပ်ငန်းအမည်",
        debouncer: debouncer,
        onChanged: (value){
          setState(() {
            searchValue = value;
          });
        },),
        //ResultList
        CaregorySearchList(controller: controller, searchValue: searchValue),
      ],
    );
  }
}


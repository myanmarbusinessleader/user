
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../controller/filter_form_controller.dart';
import '../../model/category.dart';
import '../business_filter_screen.dart';

class CaregorySearchList extends StatelessWidget {
  const CaregorySearchList({
    Key? key,
    required this.controller,
    required this.searchValue,
  }) : super(key: key);

  final FilterFormController controller;
  final String? searchValue;

  @override
  Widget build(BuildContext context) {
    return Obx(
       () {
        return Expanded(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: controller.tabIndex.value == 3 ? controller.search(null) : controller.search(searchValue), 
            builder: (context,snapshot){
              
              if(snapshot.hasError){
                debugPrint("*******ERROR: ${snapshot.error}");
                return const Center(child: Text("Something was wrong!.Try again"),);
              }
              if(snapshot.hasData){
                final data = snapshot.data;
                if(!(data == null) && data.isNotEmpty){
                  return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index){
                   
                    final category = Category.fromJson(snapshot.data![index]);

                    return InkWell(
                      onTap: (){
                         controller.changeState(allStates);
                            controller.changeTownship(allTownship);
                            controller.changeCategory(category.name);
                            Get.to(() => BusinessFilterScreen(
                            appBarTitle: category.name, 
                            hintText: "လုပ်ငန်းအမည်", 
                            search: controller.searchBusiness, 
                            onSelected: (value){
                              debugPrint("*********GO TO: ${value.name} page");
                            },
                            ));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(category.name,style: const 
                            TextStyle(color: Colors.black,)
                          ),
                        ),
                      ),
                    );
                  },
                  );
                }else{
                  return const Center(
                    child: Text(
                      "No results found!",
                    ),
                  );
                }
              }
              return const Center(child: Text("Searching....."),);
            },
            ),
          );
      }
    );
  }
}

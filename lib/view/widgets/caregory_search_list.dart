
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get.dart';

import '../../controller/filter_form_controller.dart';
import '../../model/category.dart';

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
          child: FirestoreQueryBuilder<Map<String,dynamic>>(
            query: controller.tabIndex.value == 3 ? controller.search(null) : controller.search(searchValue), 
            builder: (context,snapshot,__){
              if(snapshot.isFetching){
                return const Center(child: Text("Searching......"),);
              }
              if(snapshot.hasError){
                debugPrint("*******ERROR: ${snapshot.error}");
                return const Center(child: Text("Something was wrong!.Try again"),);
              }
              if(snapshot.hasData){
                final data = snapshot.docs;
                if(data.isNotEmpty){
                  return ListView.builder(
                  itemCount: snapshot.docs.length,
                  itemBuilder: (context,index){
                    if(snapshot.hasMore && index + 1 <= snapshot.docs.length){
                      snapshot.fetchMore();
                    }
                    final category = Category.fromJson(snapshot.docs[index].data());

                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(category.name,style: const 
                          TextStyle(color: Colors.black,)
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
              return const Center(child: Text("Let search"),);
            },
            ),
          );
      }
    );
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';


class FilterSearchList extends StatelessWidget {
  const FilterSearchList({
    Key? key,
    required this.searchValue,
    required this.search,
    required this.onSelected,
  }) : super(key: key);

  final String? searchValue;
  final void Function(String value) onSelected; 
  final Query<Map<String, dynamic>> Function(String? value) search;

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: FirestoreQueryBuilder<Map<String,dynamic>>(
            query: search(searchValue), 
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
                    final data = snapshot.docs[index].data();

                    return InkWell(
                      onTap: () => onSelected(data["name"]),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data["name"],style: const 
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
              return const Center(child: Text("Let search"),);
            },
            ),
          );
      
  }
}


import 'package:flutter/material.dart';


class FilterSearchList extends StatelessWidget {
  const FilterSearchList({
    Key? key,
    required this.searchValue,
    required this.search,
    required this.onSelected,
  }) : super(key: key);

  final String? searchValue;
  final void Function(String value) onSelected; 
  final Future<List<Map<String, dynamic>>> Function(String? value) search;

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: FutureBuilder<List<Map<String,dynamic>>>(
            future: search(searchValue), 
            builder: (context,snapshot){
              
              if(snapshot.hasError){
                debugPrint("*******ERROR: ${snapshot.error}");
                return const Center(child: Text("Something was wrong!.Try again"),);
              }
              if(snapshot.hasData){
                final dataList = snapshot.data?.map((e) => e).toList();
                if(!(dataList == null) && dataList.isNotEmpty){
                  return ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context,index){
                    final data = dataList[index];
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
              return  const Center(child: Text("Searching......"),);
            },
            ),
          );
      
  }
}

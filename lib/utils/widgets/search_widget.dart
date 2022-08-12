import 'package:flutter/material.dart';

import '../other/debounce.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.size,
    required this.onChanged,
    required this.debouncer,
    required this.hintText,
  }) : super(key: key);

  final Size size;
  final Function(String) onChanged;
  final Debouncer debouncer;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      padding: const EdgeInsets.only(left: 25,top: 10,right: 20,),
      height: 70,
      width: size.width,
      child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      IconButton(
        onPressed: (){}, 
        icon: const Icon(Icons.search,color: Colors.black,size: 35)
        ),
      //TextField
      Expanded(
        child: TextField(
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white,
        fontSize: 14,),
        onChanged: (value){
          debouncer.run(() {
            onChanged(value);
          });
        },
        decoration:  InputDecoration(
          hintText: hintText,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
          ),
          hintStyle: const TextStyle(color: Colors.white,
        fontSize: 14,),
         
        ),
        
       ),
      ),
    ]
      )
    );
  }
}
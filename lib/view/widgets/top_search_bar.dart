
import 'package:flutter/material.dart';

import '../../controller/filter_form_controller.dart';

class TopSearchBar extends StatelessWidget {
  const TopSearchBar({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final FilterFormController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
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
            controller: controller.ePController,
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white,
            fontSize: 14,),
            decoration: const InputDecoration(
            
              hintText: "လုပ်ငန်းအမည်",
              focusedBorder:  UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black38),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black38),
              ),
              hintStyle:  TextStyle(color: Colors.white,
            fontSize: 14,),
              
            ),
            
           ),
          ),
        ]
      )
    );
  }
}
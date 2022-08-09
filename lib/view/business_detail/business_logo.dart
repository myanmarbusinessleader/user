
import 'package:flutter/material.dart';

import '../../model/business_listing.dart';

class BusinessLogo extends StatelessWidget {
  const BusinessLogo({
    Key? key,
    required this.bL,
  }) : super(key: key);

  final BusinessListing bL;

  @override
  Widget build(BuildContext context) {
    return Row(
       children: [
         //Logo
         Padding(
           padding: const EdgeInsets.only(right: 20),
           child: CircleAvatar(
             radius: 35,
             backgroundImage: NetworkImage(bL.businessLogo ?? ""),
           ),
         ),
         const SizedBox(height: 20),
         //Name
         Text(bL.name,
         style: const 
         TextStyle(color: Colors.black,
         fontSize: 20,fontWeight: FontWeight.bold,))
       ],
          );
  }
}
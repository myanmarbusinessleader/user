import 'package:flutter/material.dart';

import '../../model/business_listing.dart';
import 'business_detail_screen.dart';
import 'business_logo.dart';


class BusinessProfile extends StatelessWidget {
  const BusinessProfile({
    Key? key,
    required this.bL,
  }) : super(key: key);

  final BusinessListing bL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
      child: Column(
        children: [
           BusinessLogo(bL: bL),
          const SizedBox(height: 20,),
          //Address
          Row(
            children: [
              const Icon(Icons.home,color: Colors.grey,size: 35),
              //Name
              Text(bL.businessAddress, style: Theme.of(context).textTheme.titleMedium,)
            ],
          ),
          //Phone
          Row(
            children: [
              Icon(Icons.phone,color: Colors.grey,size: 35),
              //Name
              Text(bL.contactPhoneNumer,
              style: Theme.of(context).textTheme.titleMedium,)
            ],
          ),
        ],
      ),
    );
  }
}

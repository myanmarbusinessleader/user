import 'package:flutter/material.dart';

import '../../model/business_listing.dart';
import 'business_logo.dart';


class AboutUs extends StatelessWidget {
  const AboutUs({
    Key? key,
    required this.bL,
  }) : super(key: key);

  final BusinessListing bL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BusinessLogo(bL: bL),
          const SizedBox(height: 20),
          Text(
            "Product / Service",
            style: Theme.of(context).textTheme.titleLarge,
            ),
          const SizedBox(height: 25),
          Text(
            "Some description about Business Listing.",
            style: Theme.of(context).textTheme.titleMedium,
            ),
        ],
      ),
    );
  }
}

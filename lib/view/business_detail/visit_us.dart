import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../../model/business_listing.dart';
import 'business_location_map.dart';
import 'business_logo.dart';


class VisitUs extends StatelessWidget {
  const VisitUs({
    Key? key,
    required this.bL,
  }) : super(key: key);

  final BusinessListing bL;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Column(
        children: [
          BusinessLogo(bL: bL),
          const SizedBox(height: 20),
          //GoogleMap
          BusinessLocationMap(
            initPosition: GeoPoint(
              latitude: double.parse(bL.geoPoint![0]),
              longitude: double.parse(bL.geoPoint![1]),
              ),
          ),
          //Working Hour
        ],
      ),
    );
  }
}

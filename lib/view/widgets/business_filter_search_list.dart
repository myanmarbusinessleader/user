
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide GeoPoint;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mmbl/constant/constant.dart';
import 'package:mmbl/controller/filter_form_controller.dart';
import 'package:mmbl/model/business_listing.dart';
import 'package:mmbl/utils/other/calculate_grid_count.dart';
import 'package:mmbl/utils/other/intent_method.dart';
import 'package:mmbl/view/widgets/show_map.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/router/router.dart';


class BusinessFilterSearchList extends StatelessWidget {
  const BusinessFilterSearchList({
    Key? key,
    required this.searchValue,
    required this.search,
    required this.onSelected,
  }) : super(key: key);

  final String? searchValue;
  final void Function(BusinessListing value) onSelected; 
  final Future<List<Map<String, dynamic>>> Function(String? value) search;

  @override
  Widget build(BuildContext context) {
    final FilterFormController controller = Get.find();
    final size = MediaQuery.of(context).size;
    return Expanded(
          child: FutureBuilder<List<Map<String,dynamic>>>(
            future: search(searchValue), 
            builder: (context,snapshot){
              
              if(snapshot.hasError){
                debugPrint("*******ERROR: ${snapshot.error}");
                return const Center(child: Text("Something was wrong!.Try again"),);
              }
              if(snapshot.hasData){
                final dataList = snapshot.data?.map((e) => BusinessListing.fromJson(e)).toList();
                if(!(dataList == null) && dataList.isNotEmpty){
                  var totalNotFound = 0;
                  return SingleChildScrollView(
                    child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    axisDirection: AxisDirection.down,
                    children: dataList.map((e){
                      var count = getCrossAndMain(e.businessLogo.width);
                      return StaggeredGridTile.count(
                              crossAxisCellCount: count[0],
                              mainAxisCellCount: count[1],
                              child: Card(
                                elevation: 10,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                progressIndicatorBuilder: (context, url, status) {
                                  return Shimmer.fromColors(
                                    child:  Container(
                                      color: Colors.white,
                                    ),
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.white,
                                  );
                                },
                                errorWidget: (context, url, whatever) {
                                  return const Text("Image not available");
                                },
                                imageUrl: e.businessLogo.imagePath,
                                                          ),
                              ),
                            );
                    }).toList(),
                    ),
                  );
                }else{
                  return const Center(
                    child: Text(
                      "No results found!",
                    ),
                  );
                }
              }
           return const Center(child: Text("Searching......"),);

            },
            ),
          );
      
  }
}

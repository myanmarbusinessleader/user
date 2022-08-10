
import 'package:cloud_firestore/cloud_firestore.dart' hide GeoPoint;
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mmbl/constant/constant.dart';
import 'package:mmbl/controller/filter_form_controller.dart';
import 'package:mmbl/model/business_listing.dart';
import 'package:mmbl/utils/other/intent_method.dart';
import 'package:mmbl/view/widgets/show_map.dart';

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
                final dataList = snapshot.data;
                if(!(dataList == null) && dataList.isNotEmpty){
                  var totalNotFound = 0;
                  return ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context,index){

                    final data = BusinessListing.fromJson(dataList[index]);

                    if(//Check Condition Because Firebase not support
                    //multiple where clause to Filter.
                      (controller.state.value != allStates) && (data.state != controller.state.value)
                      ||
                      (controller.township.value != allTownship) && (data.township != controller.township.value)
                      ||
                      (controller.category.value != allCategory) && (data.categoryID != controller.category.value)
                      ){
                        totalNotFound++;
                      return totalNotFound == dataList.length ?
                      SizedBox(
                        height: size.height*0.5,
                        child: const Center(
                          child: Text(
                              "No results found!",
                          ),
                        ),
                      )
                      : const SizedBox();
                    }

                    return InkWell(
                      onTap: () {
                        controller.setSelectedBL(data);
                        Get.toNamed(businessDetailScreen);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: 
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: size.width*0.5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                           //Business Name 
                                            Text(
                                              data.name,
                                              style: const TextStyle(color: Colors.black,),
                                            ),
                                              
                                            //Category
                                            Text(
                                                  data.categoryID,
                                                  style: const TextStyle(color: Colors.black,),
                                                ),
                                            //Address
                                            Text(
                                                  data.businessAddress,
                                                  style: const TextStyle(color: Colors.black,),
                                                ),
                                            //Phone
                                            Text(
                                                  data.phoneNumber ?? "",
                                                  style: const TextStyle(color: Colors.black,),
                                                ),
                                            Row(
                                              children: [
                                                //Condition Icon
                                            Expanded(
                                              child: IconButton(
                                                //Phone Call
                                                onPressed: () => makePhoneCall(data.contactPhoneNumer), 
                                                icon: Row(
                                                  children: const [
                                                     Expanded(
                                                       child: Icon(
                                                              FontAwesomeIcons.phoneVolume,
                                                              color: Colors.blue,
                                                              size: 30,
                                                            ),
                                                     ),
                                                Expanded(child: Text("Call Now",style: TextStyle(color: Colors.blue,)))
                                                  ],
                                                )
                                                ),
                                            ),
                                            IconButton(
                                              onPressed: (){
                                                //Show Google Map
                                                showMap(
                                                  context: context,
                                                  initZoom: 10,
                                                  initCurrentUserPosition: false,
                                                  // ignore: prefer_const_constructors
                                                  initPosition: GeoPoint(
                                                    latitude: double.parse(data.geoPoint![0]),
                                                    longitude: double.parse(data.geoPoint![1]),
                                                    )
                                                  );
                                              }, 
                                              icon: const Icon(Icons.map,color: Colors.blue,size: 30,)
                                              ),
                                              //Email If not null
                                            !(data.email == null) && data.email!.isNotEmpty ? 
                                              IconButton(
                                                onPressed: () => sendEmail(data.email ?? ""), 
                                                icon: const Icon(
                                                  FontAwesomeIcons.envelope,
                                                  color: Colors.blue,
                                                size: 30,),
                                                ) : const SizedBox(), 
                                              ],
                                            )
                                      ],
                                    ),
                                  ),
                                  //Business Logo
                                  Image.network(
                                      data.businessLogo ?? "",
                                      width: 150,
                                      height: 150,
                                      ),
                                   
                                ],
                              )
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
           return const Center(child: Text("Searching......"),);

            },
            ),
          );
      
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

Widget businessMap({
  required BuildContext context,
  Widget? titleWidget,
  String? title,
  TextStyle? titleStyle,
  String? textConfirmPicker,
  String? textCancelPicker,
  EdgeInsets contentPadding = EdgeInsets.zero,
  double radius = 0.0,
  GeoPoint? initPosition,
  double stepZoom = 1,
  double initZoom = 2,
  double minZoomLevel = 2,
  double maxZoomLevel = 18,
  bool isDismissible = false,
  bool initCurrentUserPosition = true,
})  {
  assert(title == null || titleWidget == null);
  assert((initCurrentUserPosition && initPosition == null) ||
      !initCurrentUserPosition && initPosition != null);
  final MapController controller = MapController(
    initMapWithUserPosition: initCurrentUserPosition,
    initPosition: initPosition,
  );

   
      return  SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.9,
          child:  SizedBox(
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: OSMFlutter(
                controller: controller,
                isPicker: true,
                stepZoom: stepZoom,
                initZoom: initZoom,
                minZoomLevel: minZoomLevel,
                maxZoomLevel: maxZoomLevel,
              ),
            ),
        );

}

class BusinessLocationMap extends StatefulWidget {
  final GeoPoint initPosition;
  const BusinessLocationMap({Key? key,
  required this.initPosition,
 /*  double stepZoom = 1,
  double initZoom = 2,
  double minZoomLevel = 2,
  double maxZoomLevel = 18, */
  }) : super(key: key);

  @override
  State<BusinessLocationMap> createState() => _BusinessLocationMapState();
}

class _BusinessLocationMapState extends State<BusinessLocationMap> {
   
 
  @override
  Widget build(BuildContext context) {
    final MapController controller = MapController(
    initMapWithUserPosition: false,
    initPosition: widget.initPosition,
  );
    return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.9,
          child:  SizedBox(
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: OSMFlutter(
                showZoomController: true,
                controller: controller,
                isPicker: true,
                stepZoom: 1,
                initZoom: 10,
                minZoomLevel: 2,
                maxZoomLevel: 18,
              ),
            ),
        );
  }
}
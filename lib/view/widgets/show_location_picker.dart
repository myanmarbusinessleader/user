import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

Future<GeoPoint?> showLocationPicker({
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
}) async {
  assert(title == null || titleWidget == null);
  assert((initCurrentUserPosition && initPosition == null) ||
      !initCurrentUserPosition && initPosition != null);
  final MapController controller = MapController(
    initMapWithUserPosition: initCurrentUserPosition,
    initPosition: initPosition,
  );

  GeoPoint? point = await showDialog(
    context: context,
    builder: (ctx) {
      return WillPopScope(
        onWillPop: () async {
          return isDismissible;
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.9,
          child: AlertDialog(
            titlePadding: const EdgeInsets.all(2),
            title: title != null
                ? Text(
                    title,
                    style: titleStyle,
                  )
                : titleWidget,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              ),
            ),
            contentPadding: contentPadding,
            content: SizedBox(
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
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: Text(
                  textCancelPicker ??
                      MaterialLocalizations.of(context).cancelButtonLabel,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final p = await controller
                      .getCurrentPositionAdvancedPositionPicker();
                  await controller.cancelAdvancedPositionPicker();
                  Navigator.pop(ctx, p);
                },
                child: Text(
                  textConfirmPicker ??
                      MaterialLocalizations.of(context).okButtonLabel,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  return point;
}
// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart'
    as google_maps_flutter;
import '/flutter_flow/lat_lng.dart' as latlng;
import 'dart:async';
export 'dart:async' show Completer;
export 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
export '/flutter_flow/lat_lng.dart' show LatLng;

class MapWithMarkers extends StatefulWidget {
  const MapWithMarkers({
    Key? key,
    this.width,
    this.height,
    required this.mapCenter,
    required this.markers,
    required this.openWindow,
    required this.questsIcon,
    required this.flowerIcon,
    required this.starIcon,
    required this.quest,
    required this.flower,
  }) : super(key: key);

  final double? width;
  final double? height;
  final latlng.LatLng mapCenter;
  final List<MarkersRecord> markers;
  final void Function(MarkersRecord currentMarker) openWindow;
  final String questsIcon;
  final String flowerIcon;
  final String starIcon;
  final MarkerType quest;
  final MarkerType flower;

  @override
  State<MapWithMarkers> createState() => _MapWithMarkersState();
}

class _MapWithMarkersState extends State<MapWithMarkers> {
  late google_maps_flutter.GoogleMapController mapController;
  late google_maps_flutter.BitmapDescriptor _questsIcon;
  late google_maps_flutter.BitmapDescriptor _flowerIcon;
  late google_maps_flutter.BitmapDescriptor _starIcon;

  @override
  void initState() {
    super.initState();
    _loadMarkerIcons();
  }

  Future<void> _loadMarkerIcons() async {
    final ImageConfiguration imageConfiguration =
        createLocalImageConfiguration(context);
    final google_maps_flutter.BitmapDescriptor questsIcon =
        await google_maps_flutter.BitmapDescriptor.fromAssetImage(
            imageConfiguration, widget.questsIcon);
    final google_maps_flutter.BitmapDescriptor flowerIcon =
        await google_maps_flutter.BitmapDescriptor.fromAssetImage(
            imageConfiguration, widget.flowerIcon);
    final google_maps_flutter.BitmapDescriptor starIcon =
        await google_maps_flutter.BitmapDescriptor.fromAssetImage(
            imageConfiguration, widget.starIcon);
    setState(() {
      _questsIcon = questsIcon;
      _flowerIcon = flowerIcon;
      _starIcon = starIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: google_maps_flutter.GoogleMap(
        cloudMapId: '90fb208532f19016',
        initialCameraPosition: google_maps_flutter.CameraPosition(
          target: google_maps_flutter.LatLng(
              widget.mapCenter.latitude, widget.mapCenter.longitude),
          zoom: 12,
        ),
        onMapCreated: (google_maps_flutter.GoogleMapController controller) {
          mapController = controller;
        },
        markers: _createMarkers(),
        zoomControlsEnabled: false,
        compassEnabled: false,
        myLocationEnabled: true,
        mapType: google_maps_flutter.MapType.normal,
      ),
    );
  }

  Set<google_maps_flutter.Marker> _createMarkers() {
    final Set<google_maps_flutter.Marker> markers = {};
    if (widget.markers.isNotEmpty) {
      for (var markerData in widget.markers) {
        google_maps_flutter.BitmapDescriptor? icon;
        if (markerData.markerType == MarkerType.quest) {
          icon = _questsIcon;
        } else if (markerData.markerType == MarkerType.flower) {
          icon = _flowerIcon;
        } else if (markerData.markerType == 'widget.quest') {
          icon = _starIcon;
        } else {
          icon = _questsIcon;
        }

        if (markerData.coordinate != null) {
          markers.add(
            google_maps_flutter.Marker(
              markerId: google_maps_flutter.MarkerId(markerData.uid),
              position: google_maps_flutter.LatLng(
                  markerData.coordinate!.latitude,
                  markerData.coordinate!.longitude),
              onTap: () {
                widget.openWindow(markerData);
              },
              icon: icon!,
            ),
          );
        }
      }
    }
    return markers;
  }
}

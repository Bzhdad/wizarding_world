// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';
import 'dart:math';

Future<LatLng> coordinateGenerator(
  int minRadius,
  int maxRadius,
  LatLng currentPosition,
) async {
  // Convert degrees to kilometers (1 degree ≈ 111 km)
  double degreesPerKm = 1 / 111.0;

  // Generate random distance within the specified radius
  double randomRadius =
      minRadius + Random().nextDouble() * (maxRadius - minRadius);
  // Generate random angle in radians
  double randomAngle = Random().nextDouble() * 2 * pi;

  // Calculate random offset in latitude and longitude
  double offsetLatitude = randomRadius * cos(randomAngle) * degreesPerKm;
  double offsetLongitude = randomRadius * sin(randomAngle) * degreesPerKm;

  // Calculate random coordinates
  double newLatitude = currentPosition.latitude + offsetLatitude;
  double newLongitude = currentPosition.longitude + offsetLongitude;

  // Return the generated random coordinates
  return LatLng(newLatitude, newLongitude);
}

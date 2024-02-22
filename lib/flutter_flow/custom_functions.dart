import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

int? dateDifferenceCheck(
  DateTime? lastQuestCreationDate,
  DateTime? currentDate,
) {
  // We need a function that compares two dates and tells how many days have passed between them
  if (lastQuestCreationDate == null || currentDate == null) {
    return null;
  }
  final difference = currentDate.difference(lastQuestCreationDate);
  return difference.inDays;
}

int calculateDistance(
  LatLng currentPosition,
  LatLng questPosition,
) {
  // we need a flutter function that compares two coordinates and tells how many meters are between them
  // we need a flutter function that compares two coordinates and tells how many meters are between them
  const int earthRadius = 6371;
  final double lat1 = currentPosition.latitude * math.pi / 180;
  final double lon1 = currentPosition.longitude * math.pi / 180;
  final double lat2 = questPosition.latitude * math.pi / 180;
  final double lon2 = questPosition.longitude * math.pi / 180;
  final double dLat = lat2 - lat1;
  final double dLon = lon2 - lon1;
  final double a = math.pow(math.sin(dLat / 2), 2) +
      math.cos(lat1) * math.cos(lat2) * math.pow(math.sin(dLon / 2), 2);
  final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  final int distance = (earthRadius * c).round();
  return distance;
}

int? questDistanceCheck(
  LatLng questPosition,
  LatLng currentPosition,
) {
  const int earthRadius = 6371000;
  final double lat1 = currentPosition.latitude * math.pi / 180;
  final double lon1 = currentPosition.longitude * math.pi / 180;
  final double lat2 = questPosition.latitude * math.pi / 180;
  final double lon2 = questPosition.longitude * math.pi / 180;
  final double dLat = lat2 - lat1;
  final double dLon = lon2 - lon1;
  final double a = math.pow(math.sin(dLat / 2), 2) +
      math.cos(lat1) * math.cos(lat2) * math.pow(math.sin(dLon / 2), 2);
  final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  final int distance = (earthRadius * c).round();
  return distance;
}

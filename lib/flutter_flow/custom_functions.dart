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
import '/auth/firebase_auth/auth_util.dart';

double? latReturner(LatLng? location) {
  // get lattitude as a from a firestore geopoint
  if (location != null) {
    return location.latitude;
  }

  return null;
}

double? longReturner(LatLng? location) {
  // get lattitude as a from a firestore geopoint
  if (location != null) {
    return location.longitude;
  }

  return null;
}

List<ConsoldatedPackageStruct> consoldatedList(
    List<PackagesRecord> listOfPackages) {
  List<ConsoldatedPackageStruct> consoldatedList = [];

  for (PackagesRecord package in listOfPackages) {
    bool found = false;
    for (ConsoldatedPackageStruct consolidatedPackage in consoldatedList) {
      if (consolidatedPackage.productName == package.productName) {
        consolidatedPackage.quantity += package.quantity;
        found = true;
        break;
      }
    }
    if (!found) {
      consoldatedList.add(ConsoldatedPackageStruct(
          productName: package.productName,
          productId: package.productId,
          quantity: package.quantity,
          unit: package.unit));
    }
  }

  return consoldatedList;
}

List<PackagesRecord> removeRepeatOrderIdPackages(
    List<PackagesRecord> unsortedPackages) {
  // get a list of packages document return only packages with unique orderid
// First, we create a map to store the unique packages based on their order ID
  final Map<String, PackagesRecord> uniquePackages = {};

  // Then, we iterate through the unsorted packages list
  for (final package in unsortedPackages) {
    // If the package's order ID is not already in the map, we add it
    if (!uniquePackages.containsKey(package.orderId)) {
      uniquePackages[package.orderId] = package;
    }
  }

  // Finally, we return the values of the map as a list of unique packages
  return uniquePackages.values.toList();
}

LatLng returnLocationFromLatandLng(
  double lat,
  double lng,
) {
  // returnLatlng form Lattitude and longutide
  return LatLng(lat, lng);
}

DocumentReference? documentReferencer(
  String? branch,
  String? ordeid,
) {
  // takes in collection name and doc id as string return doc reference located in /root/branch/orders
  return FirebaseFirestore.instance
      .collection('root')
      .doc(branch)
      .collection('orders')
      .doc(ordeid);
}

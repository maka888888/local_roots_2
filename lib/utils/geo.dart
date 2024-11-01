import 'dart:math';

import 'package:google_geocoding_api/google_geocoding_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<LatLng?> getCoordinatesFromAddress(String address) async {
  LatLng? latLng;
  const String googleApiKey = 'AIzaSyDwctEbwv0jovestz9NxLgkdxRiw74XudI';
  const bool isDebugMode = true;
  final api = GoogleGeocodingApi(googleApiKey, isLogged: isDebugMode);
  final searchResults = await api.search(address);
  final firstResult = searchResults.results.first;
  if (firstResult.geometry != null) {
    latLng = LatLng(
        firstResult.geometry!.location.lat, firstResult.geometry!.location.lng);
  }
  return latLng;
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

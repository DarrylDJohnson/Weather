import 'dart:async';

import 'package:location/location.dart';
import 'package:weather_app/models/place.dart';
import 'package:weather_app/services/http_service.dart';
import 'package:weather_app/services/keys.dart';

class LocationService {
  Future<Place> get currentLocation async {
    final completer = Completer<Place>();

    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        completer.completeError("Location services are not enabled.");
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        completer.completeError(("Location permissions are denied."));
      }
    }

    _locationData = await location.getLocation();

    completer.complete(
        placeFromCoordinates(_locationData.latitude, _locationData.longitude));

    return completer.future;
  }

  Future<Place> placeFromCoordinates(num latitude, num longitude) async {
    final request =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&result_type=locality|country&sensor=true&key=$GOOGLE_API_KEY";

    final results = await httpRequest(request);

    return Place(
      name: results['results'][0]['formatted_address'],
      lat: latitude,
      lng: longitude,
    );
  }
}

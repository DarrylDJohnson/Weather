import 'dart:async';

import 'package:geocoding/geocoding.dart' hide Location;
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/place.dart';

class LocationService {
  Future<Place> get currentLocation async {
    final completer = Completer<Place>();

    hasLocationServices.then(
      (hasService) async {
        if (hasService) {
          hasLocationPermissions.then(
            (hasPermission) async {
              if (hasPermission) {
                Position position = await Geolocator.getCurrentPosition();
                completer.complete(placeFromPosition(position));
              } else {
                completer.completeError("Location permission was not given.");
              }
            },
            onError: (error) => completer.completeError(error),
          );
        } else {
          completer.completeError("Location services are not enabled.");
        }
      },
      onError: (error) => completer.completeError(error),
    );

    return completer.future;
  }

  Future<bool> get hasLocationPermissions async {
    final completer = Completer<bool>();

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.deniedForever) {
      completer.completeError("Location permission permanently denied.");
    } else if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();

      permission = await Geolocator.checkPermission();

      completer.complete(permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse);
    } else {
      completer.complete(true);
    }

    return completer.future;
  }

  Future<bool> get hasLocationServices async {
    final completer = Completer<bool>();

    bool enabled = await Geolocator.isLocationServiceEnabled();

    if (enabled)
      completer.complete(true);
    else {
      await Geolocator.openLocationSettings();
      completer.complete(await Geolocator.isLocationServiceEnabled());
    }

    return completer.future;
  }

  Future<Place> placeFromPosition(Position position) async {
    List<Placemark> results = await GeocodingPlatform.instance
        .placemarkFromCoordinates(position.latitude, position.longitude);

    return Place(
      name: results[0].locality,
      lat: position.latitude,
      lng: position.longitude,
      description: results[0].postalCode,
    );
  }
}

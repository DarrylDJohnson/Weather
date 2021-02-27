import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/place.dart';

class SharedPref {
  static const SAVED_PLACES = 'saved_places';

  Future<List<Place>> readPlaces() async {
    List<Place> places = [];

    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getStringList(SAVED_PLACES) ?? [];

    result.forEach((place) => places.add(Place.fromJson(jsonDecode(place))));

    return places;
  }

  Future<bool> writePlace(Place place) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> places = prefs.getStringList(SAVED_PLACES) ?? [];

    /// Remove Duplicates
    places.removeWhere(
        (element) => Place.fromJson(jsonDecode(element)).name == place.name);

    /// Limit list length
    for (int x = 0; x <= places.length - 4; x++) {
      places.removeAt(0);
    }

    places.add(jsonEncode(place));

    return await prefs.setStringList(SAVED_PLACES, places);
  }
}

import 'dart:async';

import 'package:weather_app/models/place.dart';
import 'package:weather_app/models/suggestion.dart';
import 'keys.dart';

import 'http_service.dart';

class PlacesService {
  final String sessionToken;

  PlacesService(this.sessionToken);

  Future<List<Suggestion>> getSuggestions(String input, String language) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=(cities)&language=$language&components=country:us&key=$PLACES_API_KEY&sessionToken=$sessionToken';

    final result = await httpRequest(request);

    switch (result['status']) {
      case 'OK':
        List<Suggestion> suggestions = result['predictions']
            .map<Suggestion>((s) => Suggestion(s['place_id'], s['description']))
            .toList();
        return suggestions;
        break;

      case 'ZERO_RESULTS':
        return [];
        break;

      default:
        return Future.error(result['status']);
        break;
    }
  }

  Future<Place> locationFromId(String id) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$id&fields=name,geometry/location&key=$PLACES_API_KEY&sessiontoken=$sessionToken';

    final result = await httpRequest(request);

    if (result['status'] == 'OK')
      return Place(
        name: result['result']['name'],
        lat: result['result']['geometry']['location']['lat'],
        lng: result['result']['geometry']['location']['lng'],
      );
    else
      return Future.error(result['status']);
  }
}

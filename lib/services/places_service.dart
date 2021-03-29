import 'dart:async';

import 'package:weather_app/models/place.dart';
import 'package:weather_app/models/suggestion.dart';

import 'http_service.dart';
import 'keys.dart';

class PlacesService {
  final String sessionToken;

  PlacesService(this.sessionToken);

  Future<List<Suggestion>> getSuggestions(String input, String language) async {

    final request =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=(cities)&language=$language&key=$GOOGLE_API_KEY&sessiontoken=$sessionToken";

    final result = await httpRequest(request);

    print(result.toString());

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
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$id&fields=name,formatted_address,geometry/location&key=$GOOGLE_API_KEY";

    final result = await httpRequest(request);

    print("RESULTS: $result");

    if (result['status'] == 'OK')
      return Place(
          name: result['result']['name'],
          lat: result['result']['geometry']['location']['lat'],
          lng: result['result']['geometry']['location']['lng'],
          description: result['result']['formatted_address']);
    else
      return Future.error(result['status']);
  }
}

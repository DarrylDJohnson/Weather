import 'dart:async';

import 'package:weather_app/extensions/list_extension.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/place.dart';
import 'package:weather_app/models/weather.dart';

import 'http_service.dart';
import 'keys.dart';

class ForecastService {
  final Place place;

  ForecastService(this.place);

  Future<Forecast> forecast() async {
    Completer completer = Completer<Forecast>();

    try {
      Map m1 = await oneCall();

      DateTime dt =
          DateTime.fromMillisecondsSinceEpoch(m1['current']['dt'] * 1000);

      Map m2 = await historic(dt);

      List<Weather> hourly = (m1['hourly'] as List)
          .distinctJoin(m2['hourly'], (v) => v['dt'])
          .convert((w) => Weather.fromJson(w));

      List<Weather> daily = (m1['daily'] as List)
          .distinctJoin(m2['daily'], (v) => v['dt'])
          .convert((w) => Weather.fromJson(w));

      completer.complete(
        Forecast(
          areaName: place.name,
          lat: place.lat,
          lng: place.lng,
          current: Weather.fromJson(m1['current']),
          daily: daily,
          hourly: hourly,
        ),
      );
    } catch (error) {
      completer.completeError(error);
    }

    return completer.future;
  }

  Future<Map> oneCall() async {
    final request =
        "https://api.openweathermap.org/data/2.5/onecall?lat=${place.lat}&lon=${place.lng}&exclude=minutely&appid=$OPENWEATHERMAP_API_KEY";

    Map result = await httpRequest(request);

    return result;
  }

  Future<Map> historic(DateTime dateTime) async {
    final dt = (dateTime.millisecondsSinceEpoch / 1000).round();

    final request =
        "https://api.openweathermap.org/data/2.5/onecall/timemachine?lat=${place.lat}&lon=${place.lng}&dt=$dt&exclude=minutely&appid=$OPENWEATHERMAP_API_KEY";

    Map result = await httpRequest(request);

    return result;
  }
}

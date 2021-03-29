import 'weather.dart';

class Forecast {
  final String areaName;
  final double lat;
  final double lng;
  final Weather current;
  final List<Weather> daily;
  final List<Weather> hourly;

  Forecast(
      {this.areaName = '',
      this.lat,
      this.lng,
      this.current,
      this.daily = const [],
      this.hourly = const []});

  @override
  String toString() => "Forecast {current: $current ($lat, $lng)";
}

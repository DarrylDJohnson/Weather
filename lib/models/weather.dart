import 'package:weather_app/models/temperature.dart';

class Weather {
  final int id;
  final String main;
  final String description;
  final DateTime date;
  final DateTime sunrise;
  final DateTime sunset;
  final Temperature temperature;
  final Temperature feelsLike;
  final num pressure;
  final num humidity;
  final num dewPoint;
  final num uvi;
  final num clouds;
  final num visibility;
  final num windSpeed;
  final num windDegree;
  final num pop;

  Weather({
    this.id,
    this.main,
    this.description,
    this.date,
    this.sunrise,
    this.sunset,
    this.temperature,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDegree,
    this.pop,
  });

  Weather.fromJson(Map map)
      : this.id = map['weather'][0]['id'],
        this.main = map['weather'][0]['main'],
        this.description = map['weather'][0]['description'],
        this.date = _parseDateTime(map['dt']),
        this.sunrise = _parseDateTime(map['sunrise']),
        this.sunset = _parseDateTime(map['sunset']),
        this.temperature = Temperature.factory(map['temp']).toFahrenheit(),
        this.feelsLike = Temperature.factory(map['feels_like']).toFahrenheit(),
        this.pressure = map['pressure'],
        this.humidity = map['humidity'],
        this.dewPoint = map['dew_point'],
        this.uvi = map['uvi'],
        this.clouds = map['clouds'],
        this.visibility = map['visibility'],
        this.windSpeed = map['wind_speed'],
        this.windDegree = map['wind_degree'],
        this.pop = map['pop'];

  @override
  String toString() => "Weather: {$date, $temperature}";
}

DateTime _parseDateTime(d) =>
    d == null ? null : DateTime.fromMillisecondsSinceEpoch(d * 1000);

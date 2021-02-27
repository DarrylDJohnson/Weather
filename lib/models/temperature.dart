export 'package:weather_app/extensions/temperature_extension.dart';

/// A class for holding a temperature.
/// Can output temperature as Kelvin, Celsius or Fahrenheit.
class Temperature {
  final double min;
  final double max;
  final Unit unit;

  Temperature(
    this.min,
    this.max, {
    this.unit = Unit.Kelvin,
  });

  factory Temperature.factory(dynamic value, {Unit unit = Unit.Kelvin}) {
    if (value is num)
      return Temperature(value.toDouble(), value.toDouble(), unit: unit);
    else if (value is Map)
      return Temperature.fromMap(value, unit: unit);
    else {
      return Temperature(null, null, unit: unit);
    }
  }

  factory Temperature.fromMap(Map map, {Unit unit = Unit.Kelvin}) {
    double min;
    double max;

    if (map['min'] is num) min = (map['min'] as num).toDouble();

    if (map['max'] is num) max = (map['max'] as num).toDouble();

    return Temperature(min ?? max, max ?? min, unit: unit);
  }

  @override
  String toString() {
    if (min != null && max != null) {
      return min == max ? "${min.round()}°" : "${max.round()}°/${min.round()}°";
    } else {
      return "null";
    }
  }
}

enum Unit {
  Kelvin,
  Fahrenheit,
  Celsius,
}

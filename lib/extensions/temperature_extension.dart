import 'package:weather_app/models/temperature.dart';

extension TemperatureConversion on Temperature {
  Temperature toKelvin() {
    double _min;
    double _max;

    if (this.unit == Unit.Celsius) {
      if (min != null) _min = min + 273.15;
      if (max != null) _max = max + 273.15;
    } else if (this.unit == Unit.Fahrenheit) {
      if (min != null) _min = ((min - 32) * (5 / 9)) + 273.15;
      if (max != null) _max = ((max - 32) * (5 / 9)) + 273.15;
    }

    return Temperature(_min, _max, unit: Unit.Kelvin);
  }

  Temperature toCelsius() {
    double _min;
    double _max;

    if (this.unit == Unit.Kelvin) {
      if (min != null) _min = min - 273.15;
      if (max != null) _max = min - 273.15;
    } else if (this.unit == Unit.Fahrenheit) {
      if (min != null) _min = (min - 32) * (5 / 9);
      if (max != null) _max = (max - 32) * (5 / 9);
    }

    return Temperature(_min, _max, unit: Unit.Celsius);
  }

  Temperature toFahrenheit() {
    double _min;
    double _max;

    if (this.unit == Unit.Kelvin) {
      if (min != null) _min = (min - 273.15) * 9 / 5 + 32;
      if (max != null) _max = (max - 273.15) * 9 / 5 + 32;
    } else if (this.unit == Unit.Celsius) {
      if (min != null) _min = min * 9 / 5 + 32;
      if (max != null) _max = max * 9 / 5 + 32;
    }

    return Temperature(_min, _max, unit: Unit.Fahrenheit);
  }

  Temperature convert(Unit unit) {
    if (this.unit == unit) {
      return this;
    } else if (unit == Unit.Kelvin) {
      return this.toKelvin();
    } else if (unit == Unit.Celsius) {
      return this.toCelsius();
    } else {
      return this.toFahrenheit();
    }
  }

  double difference(Temperature temperature) {
    if (this.min != null && temperature.min != null)
      return (this.max - temperature.convert(this.unit).min).abs();
    else
      return null;
  }

  double maxDifference(Temperature temperature) {
    if (this.max != null && temperature.max != null)
      return (this.max - temperature.convert(this.unit).max).abs();
    else
      return null;
  }

  double minDifference(Temperature temperature) {
    if (this.min != null && temperature.min != null)
      return (this.min - temperature.convert(this.unit).min).abs();
    else
      return null;
  }

  double range() {
    return this.max - this.min;
  }
}

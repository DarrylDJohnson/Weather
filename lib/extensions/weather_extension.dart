import 'package:intl/intl.dart';
import 'package:weather_app/extensions/list_extension.dart';
import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/models/weather.dart';

extension ForecastExtension on List<Weather> {
  Temperature get tempMax {
    if (this == null || this.isEmpty) {
      return null;
    } else {
      return this
          .compare((a, b) => a.temperature.max > b.temperature.max)
          .temperature;
    }
  }

  Temperature get tempMin {
    if (this == null || this.isEmpty) {
      return null;
    } else {
      return this
          .compare((a, b) => a.temperature.min < b.temperature.min)
          .temperature;
    }
  }

  double get tempRange => tempMin.difference(tempMax);

  String get description =>
      this.mostCommonAttribute((element) => element.weatherDescription);

  DateTime get date => this.first.date;

  String get day => DateFormat("EEE").format(this.first.date);
}

extension DateTimeExtension on DateTime {
  bool isYesterday() {
    DateTime now = DateTime.now();

    return DateTime(now.year, now.month, now.day - 1)
        .isAtSameMomentAs(DateTime(this.year, this.month, this.day));
  }

  bool isToday() {
    DateTime now = DateTime.now();

    return DateTime(now.year, now.month, now.day)
        .isAtSameMomentAs(DateTime(this.year, this.month, this.day));
  }

  bool isTomorrow() {
    DateTime now = DateTime.now();

    return DateTime(now.year, now.month, now.day + 1)
        .isAtSameMomentAs(DateTime(this.year, this.month, this.day));
  }
}

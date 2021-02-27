import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/screens/components/toolbar.dart';

import 'components/current_weather_tile.dart';
import 'components/daily_weather_list_view.dart';
import 'components/hourly_weather_list_view.dart';

class ForecastScreen extends StatelessWidget {
  final Forecast forecast;

  const ForecastScreen(this.forecast);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        Toolbar(),
        CurrentWeatherTile(forecast),
        HourlyWeatherListView(forecast.hourly),
        DailyWeatherListView(forecast.daily),
      ],
    );
  }
}

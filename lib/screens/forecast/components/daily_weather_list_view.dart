import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

import 'weather_tile.dart';

class DailyWeatherListView extends StatelessWidget {
  final List<Weather> forecast;

  const DailyWeatherListView(this.forecast);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => WeatherTile(forecast[index]),
        itemCount: forecast.length,
      ),
    );
  }
}

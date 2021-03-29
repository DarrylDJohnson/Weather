import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/screens/components/weather_icon.dart';

class CurrentWeatherTile extends StatelessWidget {
  final Forecast forecast;

  const CurrentWeatherTile(this.forecast);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WeatherIcon(
              forecast.current,
              size: 72.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 36.0),
              child: Text(
                "${forecast.current.temperature}",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 96.0,
                ),
              ),
            ),
            Text(
              forecast.areaName,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

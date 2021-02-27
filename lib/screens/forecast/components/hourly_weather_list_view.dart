import 'package:flutter/material.dart';
import 'package:weather_app/extensions/weather_extension.dart';
import 'package:weather_app/models/temperature.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/forecast/components/hourly_avatar.dart';

class HourlyWeatherListView extends StatelessWidget {
  final List<Weather> hourly;

  const HourlyWeatherListView(this.hourly);

  @override
  Widget build(BuildContext context) {
    Temperature _max = hourly.tempMax;
    double _range = hourly.tempRange *2;

    return SliverToBoxAdapter(
      child: Container(
        height: 72.0 + _range,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: hourly.length > 18 ? 18 : hourly.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(
              top: (_max.max - hourly[index].temperature.max) * 2,
            ),
            child: HourlyAvatar(hourly[index]),
          ),
        ),
      ),
    );
  }
}

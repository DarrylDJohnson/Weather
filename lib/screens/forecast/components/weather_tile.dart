import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/extensions/date_extension.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/screens/components/weather_icon.dart';

import 'weather_data_grid_view.dart';

class WeatherTile extends StatelessWidget {
  final Weather weather;

  const WeatherTile(this.weather);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: WeatherIcon(weather),
      title: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(weather.date.isToday()
                ? "Today"
                : DateFormat("EEEE").format(weather.date)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: "${weather.temperature.max.round()}/",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: "${weather.temperature.min.round()}",
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                weather.description,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      children: [
        WeatherDataGridView(weather),
      ],
    );
  }
}

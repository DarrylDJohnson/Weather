import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather.dart';

class WeatherDataGridView extends StatelessWidget {
  final Weather weather;

  const WeatherDataGridView(this.weather);

  @override
  Widget build(BuildContext context) {

    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
      ),
      children: [
        ListTile(
          title: Text("Description"),
          subtitle: Text("${weather.description}"),
        ),
        ListTile(
          title: Text("Precipitation"),
          subtitle: Text("${(weather.pop * 100).round()}%"),
        ),
        ListTile(
          title: Text("Sunrise"),
          subtitle: Text(DateFormat("h:mm a").format(weather.sunrise)),
        ),
        ListTile(
          title: Text("Sunset"),
          subtitle: Text(DateFormat("h:mm a").format(weather.sunset)),
        ),
        ListTile(
          title: Text("Wind Degree"),
          subtitle: Text("${weather.windDegree}"),
        ),
        ListTile(
          title: Text("Wind Speed"),
          subtitle: Text("${weather.windSpeed} m/s"),
        ),
        ListTile(
          title: Text("Pressure"),
          subtitle: Text("${weather.pressure}"),
        ),
        ListTile(
          title: Text("Clouds"),
          subtitle: Text("${weather.clouds}%"),
        ),
      ],
    );
  }
}

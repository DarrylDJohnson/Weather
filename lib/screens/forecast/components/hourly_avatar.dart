import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather.dart';

class HourlyAvatar extends StatelessWidget {
  final Weather weather;

  HourlyAvatar(this.weather);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${weather.temperature}",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text(DateFormat("h a").format(weather.date)),
            ],
          ),
        ),
      ),
    );
  }
}

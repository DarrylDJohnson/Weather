import 'package:flutter/material.dart';
import 'package:weather_app/screens/components/weather_icon.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).accentColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WeatherIcon.code(
              0 ,
              size: 96.0,
            ),
            SizedBox(
              width: 96.0,
              child: LinearProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}

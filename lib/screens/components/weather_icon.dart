import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/models/weather.dart';

class WeatherIcon extends StatelessWidget {
  final Weather weather;
  final double size;

  final int code;

  WeatherIcon(
    this.weather, {
    this.size = 24.0,
  }) : code = weather.id;

  WeatherIcon.code(
    this.code, {
    this.size = 24.0,
  }) : weather = null;

  @override
  Widget build(BuildContext context) {

    return SvgPicture.asset(
      "assets/icons/$code.svg",
      height: size,
      width: size,
    );
  }
}

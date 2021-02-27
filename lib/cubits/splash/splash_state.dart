import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/place.dart';

@immutable
abstract class SplashState extends Equatable {
  final List props;

  SplashState([this.props = const []]) : super();
}

class SplashStateInitial extends SplashState {
  @override
  String toString() => 'SplashState: Initial';
}

class SplashStateLocation extends SplashState {
  @override
  String toString() => 'SplashState: Location';
}

class SplashStateWeather extends SplashState {
  final Place place;

  SplashStateWeather(this.place) : super([place]);

  @override
  String toString() => 'SplashState: Weather';
}

class SplashStateError extends SplashState {
  final error;

  SplashStateError(this.error) : super([error]);

  @override
  String toString() => 'SplashState: Error $error ${(error as Error).stackTrace}';
}

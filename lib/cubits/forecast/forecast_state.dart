import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast.dart';

@immutable
abstract class ForecastState extends Equatable {
  final List props;

  ForecastState([this.props = const []]) : super();
}

class ForecastStateLoading extends ForecastState {
  @override
  String toString() => 'ForecastState: Loading';
}

class ForecastStateSuccess extends ForecastState {
  final Forecast forecast;

  ForecastStateSuccess(this.forecast) : super([forecast]);

  @override
  String toString() => 'ForecastState: Success $forecast';
}

class ForecastStateError extends ForecastState {
  final error;

  ForecastStateError(this.error);

  @override
  String toString() =>
      ('ForecastState: Error $error \n${error is Error ? error.stackTrace : error.runtimeType}');
}

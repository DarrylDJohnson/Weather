import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/place.dart';

@immutable
abstract class MenuState extends Equatable {
  final List props;

  MenuState([this.props = const []]) : super();
}

class MenuStateLoading extends MenuState {
  @override
  String toString() => 'MenuState: Loading';
}

class MenuStateMain extends MenuState {
  final List<Place> places;

  MenuStateMain(this.places) : super([places]);

  @override
  String toString() => 'MenuState: Main';
}

class MenuStateError extends MenuState {
  final error;

  MenuStateError(this.error) : super([error]);

  @override
  String toString() {
    if (error is Error) debugPrintStack(stackTrace: error.stackTrace);

    return 'MenuState: Error $error';
  }
}

class MenuEvent extends MenuState {
  final Place place;

  MenuEvent(this.place) : super([place]);

  @override
  String toString() => 'LocationEvent: $place';
}

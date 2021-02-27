import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/place.dart';

@immutable
abstract class LocationState extends Equatable {
  final List props;

  LocationState([this.props = const []]) : super();
}

class LocationStateMain extends LocationState {
  @override
  String toString() => 'LocationState: Main';
}

class LocationStateLoading extends LocationState {
  @override
  String toString() => 'LocationState: Loading';
}

class LocationStatePlaces extends LocationState {

  final List<Place> places;

  LocationStatePlaces(this.places) : super([places]);

  @override
  String toString() => 'LocationState: Places';
}

class LocationStateError extends LocationState {
  final error;

  LocationStateError(this.error) : super([error]);

  @override
  String toString() => 'LocationState: Error $error';
}

class LocationEvent extends LocationState {
  final Place place;

  LocationEvent(this.place) : super([place]);

  @override
  String toString() => 'LocationEvent: $place';
}
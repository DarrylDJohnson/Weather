import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/place.dart';
import 'package:weather_app/services/forecast_service.dart';
import 'package:weather_app/services/shared_pref.dart';

import 'forecast_state.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final ForecastService forecastRepository;
  final Place place;

  ForecastCubit(this.place)
      : this.forecastRepository = ForecastService(place),
        super(ForecastStateLoading());

  init() async {
    SharedPref pref = SharedPref();
    await pref.writePlace(place);

    try {
      Forecast f = await forecastRepository.forecast();

      emit(ForecastStateSuccess(f));
    } catch (error) {
      emit(ForecastStateError(error));
    }
  }

  emitForecast() => forecastRepository.forecast().then(
        (forecast) => emit(ForecastStateSuccess(forecast)),
        onError: (error) => emit(ForecastStateError(error)),
      );

  Color getColor(Forecast forecast) {
    DateTime dateTime = DateTime.now();

    if (dateTime.isBefore(forecast.current.sunrise)) {
      return Colors.deepPurpleAccent;
    } else if (dateTime.isBefore(forecast.current.sunset)) {
      return Colors.blueAccent;
    } else {
      return Colors.deepPurple;
    }
  }

  Stream<Color> streamColor(Forecast forecast) => Stream.periodic(
        Duration(seconds: 30),
        (_) => DateTime.now(),
      ).transform(
        new StreamTransformer.fromHandlers(
          handleData: (dateTime, sink) => sink.add(getColor(forecast)),
        ),
      );
}
